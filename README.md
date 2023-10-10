# Animations
## UIKit
---
### Sliding Menu
* 구현 방법:
1. MenuView의 열림/닫힘 상태에 따라 변동해야하는 constraints를 변수에 담기
2. Menu Opened Status에 따라 constraints.isActive 상태 true / false 변경하기 + layoutIfNeeded() 메서드 호출하여 subview의 autolayout 즉시 적용시키기
3. 부드러운 sliding animation을 주기 위한 UIView.animate(withDuration: ) 메서드의 클로저 안에 menuOpenButton.toggle() 실행
<br>

![image](https://github.com/samusesapple/Animations/assets/126672733/1eb93a99-1b0b-4301-abd9-53d782056e75)
<br>

![Simulator Screen Recording - iPhone 14 Pro - 2023-10-10 at 15 48 37](https://github.com/samusesapple/Animations/assets/126672733/acdef234-db96-41cf-ac8c-45e21d12afbb)
