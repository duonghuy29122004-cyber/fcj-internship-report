---
title: "Các bài blogs đã dịch"
date: "2024-01-01"
weight: 3
chapter: false
pre: " <b> 3. </b> "
---

Tại đây sẽ là phần liệt kê, giới thiệu các blogs mà tôi đã dịch:

###  [Blog 1 - AWS CDK Ra Mắt Tính Năng Tái Cấu Trúc](3.1-Blog1/)
Blog này giới thiệu tính năng tái cấu trúc mới của AWS Cloud Development Kit (CDK) giúp việc tái cấu trúc cơ sở hạ tầng dưới dạng mã nguồn trở nên dễ dàng và an toàn hơn. Bạn sẽ tìm hiểu cách CDK Refactor bảo toàn tài nguyên AWS khi đổi tên cấu trúc, di chuyển tài nguyên giữa các ngăn xếp và sắp xếp lại các ứng dụng CDK - những hoạt động trước đây có nguy cơ thay thế tài nguyên. Bài viết trình bày ví dụ thực tế về việc tái cấu trúc ứng dụng nguyên khối thành kiến trúc microservices, cho thấy cách chia các hàm Lambda và bảng DynamoDB thành các ngăn xếp riêng biệt trong khi vẫn duy trì tính toàn vẹn dữ liệu và tránh thời gian chết.

###  [Blog 2 - Framework Quan Sát Hiện Đại cho SAP](3.2-Blog2/)
Blog này khám phá các giải pháp quan sát hiện đại cho môi trường SAP sử dụng PowerConnect và Dynatrace trên AWS. Bạn sẽ tìm hiểu cách giải quyết các thách thức giám sát trong hệ sinh thái SAP phức tạp bao gồm SAP Cloud ERP, SAP BTP và các dịch vụ AWS. Bài viết giải thích cách PowerConnect thu thập các tín hiệu quan sát từ hệ thống SAP và tích hợp với nền tảng hỗ trợ AI của Dynatrace để cung cấp khả năng hiển thị toàn diện, phát hiện vấn đề chủ động và phân tích nguyên nhân gốc rễ tự động. Bài viết bao gồm kiến trúc triển khai chi tiết, bảng điều khiển được xây dựng sẵn và tích hợp với các dịch vụ AI của AWS như Amazon Bedrock và Amazon Q.

###  [Blog 3 - Bảo Mật VIN với Reference ID trên AWS IoT](3.3-Blog3/)
Blog này trình bày giải pháp bảo mật để bảo vệ Số Nhận Dạng Xe (VIN) trong nền tảng xe kết nối trên AWS IoT. Bạn sẽ tìm hiểu cách triển khai Reference ID như một mã hiệu cho VIN, cho phép tương tác dữ liệu xe an toàn mà không làm lộ VIN thực tế. Bài viết bao gồm kiến trúc hoàn chỉnh bao gồm quy trình cung cấp xe, thiết kế cơ sở dữ liệu với DynamoDB, quản lý chứng chỉ với ACM PCA, tích hợp với AWS IoT FleetWise và xử lý thay đổi TCU (Bộ Điều Khiển Telematics). Phương pháp này giúp các nhà sản xuất ô tô tuân thủ các quy định bảo vệ dữ liệu như GDPR và CCPA trong khi vẫn duy trì đầy đủ chức năng.
