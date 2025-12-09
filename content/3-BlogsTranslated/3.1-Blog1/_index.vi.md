---
title: "AWS CDK Ra Mắt Tính Năng Tái Cấu Trúc"
date: "2024-01-01"
weight: 1
chapter: false
pre: " <b> 3.1 </b> "
---

## AWS Cloud Development Kit (CDK) Ra Mắt Tính Năng Tái Cấu Trúc

Chúng tôi rất vui mừng được giới thiệu tính năng AWS Cloud Development Kit (CDK) mới, giúp việc tái cấu trúc cơ sở hạ tầng dưới dạng mã nguồn trở nên dễ dàng và an toàn hơn. CDK Refactor hướng đến việc bảo toàn tài nguyên AWS khi bạn đổi tên cấu trúc, di chuyển tài nguyên giữa các ngăn xếp và sắp xếp lại các ứng dụng CDK – những hoạt động trước đây có nguy cơ thay thế tài nguyên.

### Vấn đề

Khi viết cơ sở hạ tầng dưới dạng mã với CDK, đôi khi các nhà phát triển cần đổi tên Construct hoặc di chuyển chúng giữa các Stack hoặc thư mục. Cho dù họ cần tổ chức mã tốt hơn, tuân thủ các phương pháp hay nhất về mã hóa hay tận dụng các mẫu lập trình hướng đối tượng như kế thừa lớp, những thay đổi này có thể gây rủi ro trong môi trường có tài nguyên được triển khai, vì chúng thay đổi ID logic do CDK tạo ra của các tài nguyên đó.

Trong quá trình triển khai CDK, AWS CloudFormation diễn giải những thay đổi này thành tài nguyên mới, thường yêu cầu xóa tài nguyên hiện có và tạo tài nguyên mới với ID logic mới. Đối với tài nguyên có trạng thái, điều này có thể gây ra thời gian chết tiềm ẩn và thậm chí mất dữ liệu. 

Để giảm thiểu tác động của những thay đổi ID này, các nhà phát triển phải dàn dựng các thay đổi của họ để tạo tài nguyên mới, tạo kế hoạch di chuyển dữ liệu hoặc mạng, sau đó xóa tài nguyên cũ để ngăn chặn những tác động tái cấu trúc này. Đôi khi, các nhà phát triển quyết định rằng rủi ro của những thay đổi này lớn hơn lợi ích của việc tái cấu trúc và chọn không thực hiện tái cấu trúc.

### Giải pháp

Ngày nay, các nhà phát triển có thể sử dụng lệnh tái cấu trúc CDK mới để phát hiện, xem xét, xác nhận và áp dụng an toàn các thay đổi đã tái cấu trúc vào tài nguyên của họ mà không cần thay thế tài nguyên. Tính năng này tận dụng tính năng tái cấu trúc AWS CloudFormation mới ra mắt gần đây, nhưng CDK sẽ tự động tính toán các ánh xạ mà CloudFormation cần để xác định lại các tài nguyên đã tái cấu trúc, cung cấp một lớp trừu tượng cho phép các nhà phát triển tập trung vào mã nguồn thay vì cấu hình tài nguyên.

### Điều kiện tiên quyết

Cùng với các điều kiện tiên quyết thông thường của CDK, nếu bạn đã khởi động dự án CDK trước lần ra mắt này, bạn cần phải khởi động lại môi trường của mình để có được các quyền mới liên quan đến khả năng cấu trúc lại CDK trước khi thử cấu trúc lại.

### Ví dụ: Từ Monolith đến Microservices

Trong ví dụ này, giả sử chúng ta có một ứng dụng CDK cũ triển khai một Stack nguyên khối với các bảng Amazon DynamoDB cho người dùng, sản phẩm và đơn hàng, cùng một hàm AWS Lambda triển khai các hoạt động CRUD trên tất cả các thực thể.

#### Kiến trúc ban đầu (Monolith)
![Architecture](/images/blog1.png)
```javascript
function monolithApp() {
  const monolith = new CdkAppStack(app, monolithStackName, {env});
  
  const usersTable = makeTable(monolith, 'users');
  const productsTable = makeTable(monolith, 'products');
  const ordersTable = makeTable(monolith, 'orders');
  
  // We have a single Lambda function in our application
  const func = new Function(monolith, `MonolithFunction`, {
    code: Code.fromInline(`Some code that accesses all three tables`),
    runtime: Runtime.NODEJS_22_X,
    handler: 'index.handler',
  });
  
  usersTable.grantReadWriteData(func);
  productsTable.grantReadWriteData(func);
  ordersTable.grantReadWriteData(func);
  
  // This function creates a REST API, resources, methods, and links
  // everything together to the functions. Right now, we are passing
  // the same function in three places.
  makeApi(monolith, {
    usersFunction: func,
    productsFunction: func,
    ordersFunction: func,
  });
}

monolithApp();
```

#### Yêu cầu tái cấu trúc

Chúng tôi được yêu cầu tuân thủ các phương pháp hay nhất của Well Architected Framework và chia khối monolith thành các hàm Lambda riêng biệt để chúng có thể mở rộng độc lập. Vì chúng rất giống nhau, chúng tôi cũng sẽ tạo một lớp Lambda có thể kế thừa mà chúng tôi có thể tái sử dụng để cải thiện khả năng đọc và bảo trì mã, đồng thời tránh phải định nghĩa lại các thiết lập cấu hình Lambda thống nhất trên tất cả các hàm.

Cuối cùng, khối đơn khối chỉ sử dụng Cấu trúc CDK L1. Để trừu tượng hóa mã nguồn hơn nữa và tận dụng các hàm hỗ trợ, chúng ta sẽ bắt đầu sử dụng Cấu trúc CDK L2 cho DynamoDB, Lambda và API Gateway. Thay đổi này sẽ cho phép tự động định nghĩa các Quyền và Vai trò IAM, giúp mã nguồn đơn giản hơn.

![Kiến trúc Microservices](/images/blog1.2.png)

Đề xuất ứng dụng được tái cấu trúc thành các ngăn xếp riêng biệt cho từng miền. Nếu không có tính năng tái cấu trúc, CloudFormation sẽ xóa và tạo lại tài nguyên, gây mất dữ liệu.

### Thay Thế Tài Nguyên Không Trạng Thái

Tái cấu trúc mã CDK để chia Lambda nguyên khối thành 3 Lambda riêng:

```javascript
function singleStackMicroservicesApp() {
  const monolith = new CdkAppStack(app, monolithStackName, {env});
  
  makeApi(monolith, {
    usersFunction: makeFunctionAndTable(monolith, 'users'),
    productsFunction: makeFunctionAndTable(monolith, 'products'),
    ordersFunction: makeFunctionAndTable(monolith, 'orders'),
  });
}
```

### Tái Cấu Trúc Tài Nguyên Có Trạng Thái

Tạo các ngăn xếp mới và di chuyển tài nguyên:

```javascript
function fullMicroservicesApp() {
  const monolith = new Stack(app, monolithStackName, {env});
  const usersStack = new Stack(app, 'Users', {env});
  const productsStack = new Stack(app, 'Products', {env});
  const ordersStack = new Stack(app, 'Orders', {env});
  
  makeApi(monolith, {
    usersFunction: makeFunctionAndTable(usersStack, 'users'),
    productsFunction: makeFunctionAndTable(productsStack, 'products'),
    ordersFunction: makeFunctionAndTable(ordersStack, 'orders'),
  });
}
```

Chạy `cdk refactor --unstable=refactor` để di chuyển tài nguyên an toàn mà không mất dữ liệu.

### Kết Luận

Tính năng CDK Refactor cho phép nhà phát triển tái cấu trúc infrastructure code một cách tự tin, bảo toàn tài nguyên AWS và giảm thiểu rủi ro. Đọc thêm trong tài liệu CDK Refactor để bắt đầu!

---

**Nguồn:** AWS Blog  
**Ngày:** 10 Tháng 9 Năm 2025  
**Dịch bởi:** Dương Nguyễn Gia Huy
