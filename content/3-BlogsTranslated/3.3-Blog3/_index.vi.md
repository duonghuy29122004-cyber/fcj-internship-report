---
title: "Bảo Mật VIN với Reference ID trên AWS IoT"
date: "2024-01-01"
weight: 3
chapter: false
pre: " <b> 3.3 </b> "
---

## Bảo Mật Số Nhận Dạng Xe (VIN) với ID Tham Chiếu trong Nền Tảng Xe Kết Nối AWS IoT

### Giới thiệu

Với hơn 470 triệu ô tô kết nối dự kiến vào cuối năm 2025, việc bảo vệ dữ liệu xe nhạy cảm, đặc biệt là Số Nhận dạng Xe (VIN), đã trở nên vô cùng quan trọng đối với các nhà sản xuất ô tô. VIN đóng vai trò là mã định danh duy nhất trong các quy trình sản xuất ô tô, từ sản xuất đến bảo dưỡng, khiến chúng trở thành mục tiêu hấp dẫn đối với tội phạm mạng.
![Architecture](/images/blog3.png)
### Vấn đề

Số VIN chứa thông tin quan trọng về xe (nhà sản xuất, mẫu xe, năm sản xuất) và có thể được liên kết với dữ liệu cá nhân. Số VIN không được bảo vệ trong môi trường đám mây có nguy cơ:

- Đánh cắp danh tính
- Trộm cắp xe
- Gian lận bảo hiểm
- Vi phạm quyền riêng tư
- Không tuân thủ quy định (GDPR, CCPA)

### Giải pháp: Reference ID

Giải pháp này giới thiệu **ID Tham chiếu** dưới dạng mã hiệu cho VIN, giúp tương tác dữ liệu xe an toàn mà không làm lộ VIN thực tế.

#### Cách Hoạt Động

Hệ thống sử dụng ID Tham chiếu, trong đó mỗi xe nhận được một mã định danh duy nhất (UUID) trong quá trình cung cấp, hoạt động như proxy VIN trong mọi tương tác nền tảng. Cơ sở dữ liệu đăng ký xe lưu trữ cả phiên bản băm và mã hóa của VIN, được ánh xạ với ID Tham chiếu.

VIN được mã hóa bằng AWS Key Management Service (KMS) như một biện pháp phòng ngừa. Khi cần truy xuất VIN dạng văn bản thuần túy, có thể giải mã giá trị này, đảm bảo VIN thực tế chỉ truy cập được khi thực sự cần thiết.

#### Lợi Ích

- Hoạt động như proxy cho VIN, tăng cường bảo mật và giảm thiểu dữ liệu
- Hỗ trợ tuân thủ các quy định bảo vệ dữ liệu
- Cung cấp khả năng kiểm soát truy cập linh hoạt
- Khả năng kiểm toán được cải thiện
- Khả năng mở rộng cho đội xe lớn
- Khả năng tương tác hệ thống dễ dàng hơn
- Cho phép thu hồi mà không cần thay đổi VIN cơ bản

## Kiến Trúc Hệ Thống

### 1. Reference ID

ID tham chiếu là UUID được tạo trong quá trình cung cấp xe, đóng vai trò là proxy VIN trong suốt vòng đời của xe, tạo ra lớp trừu tượng bảo vệ dữ liệu VIN nhạy cảm.

### 2. Cơ Sở Dữ Liệu Đăng Ký Xe

Cơ sở dữ liệu đăng ký xe đóng vai trò là kho lưu trữ tập trung thông tin về xe. Các tính năng chính:

- ID tham chiếu đến ánh xạ VIN băm
- Lưu trữ VIN được mã hóa
- Cung cấp phương tiện và theo dõi thay đổi trạng thái
- Lịch sử thay đổi thiết bị
- Thuộc tính và cấu hình xe

**Cấu trúc Database:**
- `referenceId` – Khóa phân vùng
- `deviceId` – Chỉ mục phụ toàn cầu
- `hashedVin` – Chỉ số thứ cấp toàn cầu
- `tenantId`
- `encryptedVin`

### 3. Quy Trình Cung Cấp Xe

#### 3.1 Xác thực dữ liệu
1. Cơ sở hạ tầng cung cấp băm VIN và truy vấn database để kiểm tra lần cung cấp đầu tiên
2. Đối với xe mới, DEVICE_ID được xác thực dựa trên dữ liệu từ nhà sản xuất TCU
3. Kiểm tra xem DEVICE_ID đã được gắn vào xe khác chưa

#### 3.2 Tạo Reference ID
1. Truy vấn database để xác thực xe đã được cung cấp chưa
2. Nếu chưa, tạo UUID mới làm Reference ID
3. Lưu trữ Reference ID, VIN băm và VIN mã hóa (qua KMS)
4. Đảm bảo tính duy nhất của UUID

#### 3.3 Tạo chứng chỉ
- Chứng chỉ được tạo bằng ACM PCA với Common Name = Reference ID

#### 3.4 Tích hợp AWS IoT
1. Tạo AWS IoT Thing với Thing Name = Reference ID
2. Tạo AWS IoT FleetWise Vehicle với Vehicle Name = Reference ID

#### 3.5 Phản hồi
- Xe nhận được Certificate và Reference ID
- Xe kết nối với AWS IoT FleetWise bằng certificate và ClientId = ReferenceID

### 4. Thu Thập và Lưu Trữ Dữ Liệu

#### 4.1 Xe đến AWS IoT FleetWise
- Xe kết nối bằng Reference ID làm Client ID
- Mọi dữ liệu được liên kết với Reference ID

#### 4.2 AWS IoT FleetWise đến Data Platform
- Dữ liệu được bổ sung thêm Vehicle Name (Reference ID)

#### 4.3 Lưu trữ và truy xuất
- Dữ liệu được lưu trữ với Reference ID làm identifier
- Ứng dụng mobile truy vấn qua API Platform bằng Reference ID

### 5. Tương Tác Ứng Dụng Khách Hàng

#### 5.1 Chuyển đổi VIN sang Reference ID
1. Sau khi xác minh quyền sở hữu, ứng dụng gọi API để chuyển đổi
2. API truy vấn database để lấy Reference ID tương ứng
3. Reference ID được trả về cho ứng dụng

**Cân nhắc bảo mật:**
- Kiểm soát truy cập chặt chẽ qua authentication và authorization
- Ghi log tất cả yêu cầu chuyển đổi
- Rate limiting và bảo vệ chống DoS/DDoS
- Giới hạn quyền truy cập cho ứng dụng được ủy quyền

#### 5.2 Sử dụng Reference ID
Sau khi có Reference ID, ứng dụng có thể:
1. Truy xuất dữ liệu từ data platform
2. Thực hiện thao tác trực tiếp trên xe (remote commands)

### 6. Thay Đổi Bộ Điều Khiển Telematics (TCU)

#### 6.1 Cập nhật TCU
**Input:** VIN băm (hoặc Reference ID), DEVICE_ID hiện tại, DEVICE_ID mới

**Quy trình:**
1. Xác minh VIN băm và DEVICE_ID hiện tại
2. Kiểm tra DEVICE_ID mới chưa liên kết với xe khác
3. Cập nhật DEVICE_ID trong database
4. Thu hồi và xóa certificate hiện tại
5. TCU mới trải qua quy trình provisioning

#### 6.2 Xóa TCU
**Input:** VIN băm (hoặc Reference ID), DEVICE_ID hiện tại

**Quy trình:**
1. Xác minh VIN băm và DEVICE_ID
2. Xóa DEVICE_ID khỏi database
3. Thu hồi và xóa certificate

## Cân Nhắc Bảo Mật và Hiệu Suất

### Bảo mật
- Giảm thiểu rủi ro lộ VIN trong hoạt động hàng ngày
- Chỉ lưu trữ VIN đã băm và mã hóa
- Mã hóa AWS KMS
- Chính sách kiểm soát truy cập nghiêm ngặt

### Hiệu suất và Khả năng mở rộng
- Công nghệ tạo UUID hiệu quả
- Global Secondary Indexes từ DynamoDB cho truy vấn nhanh
- Khả năng mở rộng cho đội xe lớn

### Tương lai
- Tích hợp blockchain hoặc distributed ledger
- Phân tích nâng cao và machine learning
- Tuân thủ liên tục GDPR và CCPA

## Kết Luận

Hệ thống Reference ID giúp các nhà sản xuất ô tô nâng cao bảo mật VIN trong nền tảng xe kết nối trên AWS. Kiến trúc này:

- Bảo vệ dữ liệu xe nhạy cảm
- Duy trì đầy đủ chức năng
- Khả năng mở rộng hiệu quả
- Đáp ứng tiêu chuẩn tuân thủ
- Cung cấp framework linh hoạt cho quản lý danh tính xe

Khi số lượng xe kết nối ngày càng tăng, các biện pháp bảo mật mạnh mẽ trở nên vô cùng quan trọng. Hệ thống này không chỉ bảo vệ VIN mà còn giúp đáp ứng các yêu cầu về bảo vệ dữ liệu.

Bạn nên tìm hiểu cách thức áp dụng phương pháp này vào các giải pháp xe kết nối của mình. Để biết thêm thông tin về các dịch vụ AWS IoT và các phương pháp hay nhất về xe kết nối, hãy truy cập tài liệu AWS IoT FleetWise và các bài đăng trên blog liên quan.

---

**Nguồn:** AWS Blog  
**Ngày:** 10 Tháng 9 Năm 2025  
**Dịch bởi:** Dương Nguyễn Gia Huy
