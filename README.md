# 🐶🐱 순양 분양소
> 유기동물을 위한 정보 플랫폼은 유기 반려동물 입양에 필요한 여러 정보를 한 사이트에서 제공하는 플랫폼으로, 유기 동물 보호 정보(분양), 반려동물 중고거래(마켓), 반려동물 실종 정보, 진료소 정보,펫 시터 구인 서비스를 제공합니다.

## 👷🏻 개발 기간 및 인원
- 개발 기간 : 2022.12.16 - 2023.01.26
- 인원 : 5인 (BE)

## ⚙️ 개발 환경
- Java 8
- Spring
- Tomcat
- MySQL
- mongoDB
- MyBatis
- WebSocket
- JDBC
- Maven
- AWS S3
- ubuntu
- Filezilla
- JQuery
- HTML
- CSS

## 🔧 시스템 구성도
<img width="743" alt="스크린샷 2024-11-06 오후 4 35 38" src="https://github.com/user-attachments/assets/0550adaf-38b9-4a6c-aeec-42f1eb629693">

## 💬 요구사항 정의서
<img width="347" alt="스크린샷 2024-11-06 오후 5 03 01" src="https://github.com/user-attachments/assets/c0e86929-9baf-4e99-b781-f6708f76187e">

## 🗃 ERD, 테이블 정의서
<img width="831" alt="스크린샷 2024-11-06 오후 4 37 35" src="https://github.com/user-attachments/assets/50f5ea59-add3-4430-938b-d3407611d37c">

## 💭 Use Case Diagram
<img width="785" alt="스크린샷 2024-11-06 오후 4 40 28" src="https://github.com/user-attachments/assets/0e52a3c5-b05b-4e34-967e-a9582ee8da14">

## 💭 Flow Chart
<img width="601" alt="스크린샷 2024-11-06 오후 4 40 21" src="https://github.com/user-attachments/assets/e00e22ce-dadb-46aa-8238-3b7b0cffd349">

## 💭 Sequence Diagram
<img width="845" alt="스크린샷 2024-11-06 오후 4 40 45" src="https://github.com/user-attachments/assets/c4a7c098-ab96-4c25-9524-de7cf1038162">

## 💭 Class Diagram
<img width="825" alt="스크린샷 2024-11-06 오후 4 48 39" src="https://github.com/user-attachments/assets/e99a6733-125f-4b7e-8cc4-eff623a3b5b8">
<img width="835" alt="스크린샷 2024-11-06 오후 4 49 14" src="https://github.com/user-attachments/assets/bced0705-99c3-40a2-8dcd-42de0bfbd871">
<img width="845" alt="스크린샷 2024-11-06 오후 4 49 29" src="https://github.com/user-attachments/assets/86ed8070-207b-4fcf-9d36-a22cb9336783">

## ✨ 구현 기능

<details>
<summary>🚶🏻 로그인</summary>
<div markdown="1">
<h4>💡 Kakao API를 적용한 로그인 및 회원가입</h4>
<img width="471" alt="스크린샷 2024-11-06 오후 5 07 51" src="https://github.com/user-attachments/assets/02f1157c-7904-4647-a97e-5e178764feab">
<ul>
<li> Kakao login API 연결을 통한 간편 로그인 기능 제공</li>
<li> 세션에 사용자 정보를 저장하여 다양한 사용자 정보 관리 및 상태 유지</li>
<li> Kakao Post API 연결하여 회원가입 시 주소 검색 기능 제공</li>
</ul>
</div>
</details>

<details>
<summary>🦮 펫시터</summary>
<div markdown="1">
<h4>💡 주소 기반 펫시터 매칭</h4>
<img width="343" alt="스크린샷 2024-11-06 오후 5 09 36" src="https://github.com/user-attachments/assets/dbfd3ec6-574d-4032-8e94-5c066a9e9db7">
<ul>
<li> 주소를 기반으로 한 검색 결과 제공</li>
<li> 이미지 등록이 가능한 펫시터 구인 게시판 구현</li>
<li> WebSocket을 이용한 펫시터 등록 기능 제공</li>
</ul>
</div>
</details>
