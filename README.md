# beigeShop
JSP, Javascript, Java 등을 활용한 홈쇼핑
## 실행 환경
- Eclipse 2020-06 
https://www.eclipse.org/downloads/packages/release/2020-06/r
- Tomcat 7.0.108
https://archive.apache.org/dist/tomcat/tomcat-7/
- jdk 1.8.0_291 
https://www.oracle.com/java/technologies/downloads/#java8

## 빌드 방법
1. `git clone` 혹은 `Code download`로 프로젝트 다운로드

2. 이클립스에서 `Import - Existing Projects into Workspace` 로 프로젝트 추가

3. `Project Explorer`에서 프로젝트를 우클릭 `Properties`로 이동

4. `Resource - Text file encoding`을 `UTF-8`로 변경

5. `Project Facets` 에서 모두 체크 해제 후 `Dynamic Web Module`, `Java`, `JavaScript` 체크

6. `src/util/EnvBeige.java` 파일에서 외부 서비스 API Key 설정 후 빌드