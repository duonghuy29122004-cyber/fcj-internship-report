---
title: "Framework Quan Sát Hiện Đại cho SAP"
date: "2024-01-01"
weight: 2
chapter: false
pre: " <b> 3.2 </b> "
---

## Các Framework Quan Sát Hiện Đại cho SAP: Giải Pháp cho Các Thách Thức Giám Sát với PowerConnect và Dynatrace

*Bài viết này được thực hiện chung với Dynatrace và SoftwareOne PowerConnect. Chúng tôi xin chân thành cảm ơn Krzysztof Ziemianowicz, Giám đốc Dịch vụ Mở rộng tại Dynatrace, và Stephen Bangs, Kiến trúc sư Giải pháp SAP tại SoftwareOne PowerConnect, vì những đóng góp và hỗ trợ của họ.*

### Thách thức

Môi trường SAP hiện đại đòi hỏi khả năng giám sát tinh vi khi quy trình kinh doanh mở rộng ra ngoài phạm vi các hệ thống đơn lẻ. Các tổ chức hiện đang quản lý các nền tảng được kết nối với nhau, bao gồm:

- SAP Cloud ERP
- SAP Business Technology Platform (BTP)
- Dịch vụ AWS
- Nhiều giải pháp đám mây khác

Sự phức tạp này đòi hỏi một cách tiếp cận mới để giám sát hệ thống. Các công cụ giám sát truyền thống, được thiết kế cho các số liệu hệ thống đơn lẻ và cảnh báo phản ứng, không còn đáp ứng được nhu cầu của các quy trình kinh doanh tích hợp ngày nay. Hoạt động hiện đại đòi hỏi khả năng hiển thị toàn diện trên tất cả các hệ thống được kết nối để duy trì hiệu suất tối ưu.

### Giải pháp: PowerConnect và Dynatrace

SoftwareOne PowerConnect for SAP Solutions giải quyết những thách thức này bằng cách cung cấp phạm vi phủ sóng rộng khắp hệ sinh thái SAP. Khung quan sát của nó chuyển đổi hoạt động giám sát hệ thống cụ thể thành thông tin tình báo hữu ích thông qua các tiêu chuẩn OpenTelemetry, cho phép quản lý hiệu suất chủ động và cung cấp thông tin chi tiết về hoạt động theo thời gian thực.

Bằng cách kết hợp chuyên môn sâu rộng về SAP của PowerConnect với nền tảng hỗ trợ AI của Dynatrace, các tổ chức sẽ đạt được:

- **Khả năng hiển thị toàn diện của hệ thống**
- **Phát hiện vấn đề chủ động**
- **Phân tích nguyên nhân gốc rễ tự động**
- **Kết quả kinh doanh được cải thiện**

Phương pháp tiếp cận tích hợp này cung cấp khả năng hiển thị toàn diện quy trình, giúp các tổ chức ngăn ngừa gián đoạn và tối ưu hóa hoạt động trên toàn bộ hệ thống SAP.

### Nâng cao Khả Năng Hiển Thị SAP

PowerConnect thu thập các tín hiệu quan sát từ SAP Cloud ERP, SAP BTP và SAP SaaS, sau đó ghi lại chúng trong kho dữ liệu Dynatrace Grail. Đây là nơi các tổ chức có thể duy trì tất cả các tín hiệu quan sát của AWS, theo một mô hình phân tích thống nhất – giống hệt như cách bạn xem toàn bộ môi trường CNTT của mình như một thể thống nhất.

Dynatrace là một phần của AWS Agentic AI Marketplace, và các giải pháp Dynatrace hiện có thể được tích hợp sẵn trong các dịch vụ AI của AWS, chẳng hạn như:
- Amazon Q
- Amazon Bedrock
- Amazon SageMaker

Sự hợp tác này cho phép các doanh nghiệp khai thác những hiểu biết sâu sắc hơn và tự tin thúc đẩy chuyển đổi số.

### Khả Năng của Nền Tảng

Nền tảng quan sát Dynatrace được hỗ trợ bởi AI chuyển đổi dữ liệu đo từ xa thành thông tin tình báo hữu ích thông qua:

- Khả năng phát hiện mẫu hình tinh vi được hỗ trợ bởi AI/ML
- Phân tích tự động
- Bảng điều khiển được xây dựng sẵn
- Khả năng trực quan hóa trực quan các môi trường SAP phức tạp
- Xác định nhanh chóng các vấn đề về hiệu suất
- Phát hiện các cơ hội tối ưu hóa

Trí tuệ ngữ cảnh toàn diện được hỗ trợ bởi AI của nền tảng đảm bảo các tổ chức có thể theo dõi các giao dịch và hiểu rõ các mối quan hệ phụ thuộc trên toàn bộ ngăn xếp công nghệ của họ.
![Architecture](/images/blog2.png)

### Cài Đặt PowerConnect

Việc cài đặt PowerConnect cho các giải pháp SAP được hỗ trợ trên tất cả các hệ thống SAP trong SAP Cloud ERP riêng. Các bước cài đặt:

1. **Gửi yêu cầu tới SAP Enterprise Cloud Services (ECS)** để cài đặt PowerConnect ABAP (bao gồm SAP S/4HANA) và nếu cần, cài đặt PowerConnect Java (bao gồm SAP Process Orchestration và SAP BusinessObjects)

2. **Gửi yêu cầu đến SAP ECS** để cho phép URL đối tượng thuê Dynatrace từ máy chủ proxy trong tài khoản được quản lý của SAP

3. **Cài đặt PowerConnect cho SAP** trên ứng dụng Dynatrace từ Dynatrace Hub

4. **Hình dung và phân tích** các tín hiệu SAP bằng bảng thông tin Dynatrace khi dữ liệu bắt đầu truyền

### Các Trường Hợp Sử Dụng

Sau khi cấu hình, các tổ chức có thể tận dụng bảng thông tin có sẵn cho các trường hợp sử dụng:

- Công việc nền và hàng loạt
- ABAP dump và lỗi thời gian chạy
- Phân tích nhật ký kiểm tra bảo mật và nhật ký ứng dụng
- Quy trình làm việc, khóa và yêu cầu cập nhật
- RFC giao dịch và các giao dịch RFC xếp hàng
- Trạng thái IDoc, phân đoạn IDoc và giám sát phân phối đi
![Architecture](/images/blog2.1.png)
Có hơn **200 bảng thông tin được thiết kế sẵn** trong ứng dụng PowerConnect for SAP on Dynatrace, và các tổ chức có thể tự xây dựng bảng thông tin riêng.

### Tính Năng Nâng Cao

**Ứng dụng Theo dõi Phân tán** tập trung và phân tích các dấu vết SAP được PowerConnect thu thập trên nhiều hệ thống.

**Ứng dụng Business Flow** lập bản đồ và đánh giá việc thực thi quy trình SAP và các sự kiện kinh doanh.

### Một Giải Pháp Duy Nhất cho Tất Cả Môi Trường SAP

Kiến trúc tích hợp tiêu chuẩn hỗ trợ các giải pháp đám mây SAP, bao gồm:
- SAP BTP
- SAP Integration Suite
- SAP SuccessFactors
- SAP Ariba
- SAP Fieldglass
![Architecture](/images/blog2.2.png)
#### Triển khai

Mô hình kiến trúc này được triển khai như sau:

1. **Cung cấp Amazon EC2:** Các tổ chức cung cấp phiên bản Amazon EC2 trên AWS để lưu trữ tác nhân độc lập PowerConnect Cloud

2. **High Availability:** Tác nhân có thể được cài đặt trên một hoặc hai phiên bản EC2 để cung cấp tính khả dụng cao

3. **Kết nối API:** Phiên bản Amazon EC2 kết nối với API SAP và trích xuất các tín hiệu được chuyển tiếp đến Dynatrace

4. **Tài liệu cài đặt:** Các bước cài đặt PowerConnect Cloud trên Amazon EC2 được cung cấp trong tài liệu cài đặt

5. **Kết nối:** Phiên bản EC2 cần kết nối với:
   - Nền tảng SAP BTP
   - Các ứng dụng SAP SaaS
   - Đối tượng thuê Dynatrace

6. **Tùy chọn Cloud Foundry:** PowerConnect Cloud có thể được cài đặt trong môi trường SAP BTP Cloud Foundry bằng các công cụ dòng lệnh Cloud Foundry

#### Dashboard theo Vai trò
![Dashboard](/images/blog2.3.png)
Dynatrace cung cấp một nguồn dữ liệu duy nhất có thể hiển thị ngay lập tức dữ liệu cần thiết trong bảng thông tin theo vai trò, chẳng hạn như:
- Theo dõi thông báo SAP CPI
- Thông tin chi tiết về syslog của SAP BTP

### Kết Luận

Việc tích hợp Dynatrace và PowerConnect trên AWS mang đến khuôn khổ quan sát hiện đại, vượt ra ngoài các phương pháp tiếp cận hệ thống đơn lẻ truyền thống, cung cấp khả năng hiển thị toàn diện và thông tin chi tiết dựa trên AI cần thiết cho các môi trường SAP kết nối ngày nay.

#### Lợi ích Chính

Bằng cách tận dụng:
- Cơ sở hạ tầng có khả năng mở rộng của AWS
- Tích hợp dịch vụ AI gốc thông qua AWS Agentic AI Marketplace
- Các tùy chọn triển khai marketplace liền mạch

Các tổ chức có thể nhanh chóng triển khai giải pháp này để chuyển đổi năng lực giám sát SAP của mình.

#### Giá trị Kinh doanh

Sự kết hợp giữa Dynatrace và PowerConnect trên AWS mang lại giá trị kinh doanh hữu hình khi các tổ chức:
- Có được thông tin chi tiết theo thời gian thực về các quy trình kinh doanh quan trọng
- Xác định các điểm nghẽn
- Tối ưu hóa quy trình làm việc
- Nâng cao trải nghiệm người dùng trên toàn bộ môi trường SAP

#### Tính Khả Dụng

Dynatrace Platform và PowerConnect for SAP Solutions hiện có sẵn trên AWS Marketplace.

---

**Nguồn:** AWS Blog  
**Tác giả:** Abhik Ray và Bharat Ramaka  
**Ngày:** 09 Tháng 9 Năm 2025  
**Dịch bởi:** Dương Nguyễn Gia Huy

*Dynatrace, Grail và logo Dynatrace là các thương hiệu của tập đoàn Dynatrace, Inc.*
