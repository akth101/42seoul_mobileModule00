# ex02  
간단한 계산기 앱을 만드는 과제

1. 주요 기술적 이슈와 해결 과정

1-1. Button들을 responsive하게 만들기  

Expanded라는 위젯을 이용하여 구현을 시도하였으나 Expanded가 정확히 어떤 특성을 갖는지 몰라서 한참을 헤매다가 공식 문서를 바탕으로 정확하게 그 정체를 파악한 후 구현하였습니다.  

공식 문서에 기술된 Expanded의 정확한 동작:  
Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space along the main axis.  

즉, 상위 Flex 위젯 내에서 주축(main axis) 방향으로 자식 위젯을 확장시킵니다.  

따라서 expanded의 동작은 아래와 같습니다:

buttonField 내 최상위 expand -> 상위 위젯인 column의 주축 방향으로 자식 위젯인 column을 확장시킴, 즉 buttonField 영역 자체를 세로축 방향으로 확장시킴    
buttonField 내 두 번째 expand -> 상위 위젯인 column의 주축 방향으로 자식 위젯인 row를 확장시킴, 즉 버튼 가로줄 하나를 세로축 방향으로 확장시킴  
buttonField 내 마지막 expand -> 상위 위젯인 Row의 주축 방향으로 자식 위젯인 indivButton을 확장시킴, 즉 개별 버튼 하나를 가로축 방향으로 확장시킴  

부가적으로 column과 row는 flex 위젯의 변형이라는 사실도 알게 되었습니다.  