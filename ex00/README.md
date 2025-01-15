# ex00

정중앙에 위치하며 화면 크기에 따라 크기가 조절되는 text와 button을 만드는 과제입니다.
이 과제를 수행하며 알게 된 것들을 정리해 보았습니다.  


---

목차  
1. Container와 Sizedbox의 차이점
2. responsive한 UI를 만들 때의 가이드라인
3. statelessWidget과 statefuleWidget의 차이점

---

1. Container와 Sizedbox의 차이점  
Flutter 공식 문서에서 제공하는 매개변수 리스트입니다. 이를 통해 SizedBox는 말 그대로 단순히 위젯 사이의 공간을 추가하는 가벼운 위젯, Container는 다양한 UI를 그릴 수 있는 무거운 위젯이라는 것을 알 수 있었습니다.
Container를 써야 할 상황에 SizedBox를 사용하는 상황은 애초에 불가능하겠지만 SizedBox를 써야 할 상황에 Container를 쓴다면 불필요한 메모리 낭비가 될 것이므로 주의해서 써야 합니다.

~~~ dart
(new) SizedBox SizedBox({
  Key? key,
  double? width,
  double? height,
  Widget? child,
})
package:flutter/src/widgets/basic.dart
~~~

~~~ dart
(new) Container Container({
  Key? key,
  AlignmentGeometry? alignment,
  EdgeInsetsGeometry? padding,
  Color? color,
  Decoration? decoration,
  Decoration? foregroundDecoration,
  double? width,
  double? height,
  BoxConstraints? constraints,
  EdgeInsetsGeometry? margin,
  Matrix4? transform,
  AlignmentGeometry? transformAlignment,
  Widget? child,
  Clip clipBehavior = Clip.none,
})
package:flutter/src/widgets/container.dart

~~~

2. Responsive한 UI를 만들 때의 가이드라인  

1) Abstract  
동적으로 만들 위젯들을 식별하고 해당 위젯들의 생성자를 분석하여 공유할 수 있는 데이터를 추상화하여야 합니다. 예를 들어 설명하자면 Dialog 위젯에서 전체 화면 dialog든, 팝업 dialog든 결국 같은 내용을 보여줍니다. 이때 해당 내용을 추상화하여 단일하게 관리할 수 있다면 훨씬 더 구조적이고 편리한 코드가 될 것입니다. 또한, 화면이 작을 때는 NavigationBar를 사용하고 화면이 클 때는 NavigationRail을 사용하고 싶을 때가 있을 텐데 이 위젯들이 navigation의 목적지를 공유하도록 Destination 위젯을 만들어 목적지를 추상화할 수도 있을 것입니다.

2) Measure  
전 단계에서 추상화한 위젯들은 언제 어떤 형태로 보여줄지 결정하기 위해 화면 크기를 측정해야 합니다. 예를 들어 화면이 작을 때는 NavigationBar를 사용하여야 하고, 화면이 클 때는 Navigationrail을 사용하여야 하는데 이처럼 화면 크기에 따라 사용하는 위젯을 달리하려면 당연히 화면의 크기를 측정해야 할 필요가 있는데 MediaQuery & LayoutBuilder 이렇게 크게 2가지 방법이 있습니다.

3) Branch  
이 시점에서, UI의 어떤 버전을 표시할지 결정하기 위한 크기 기준점을 선택해야 합니다.    
예를 들어, Material 디자인 가이드라인에서는:  
창 너비가 600 논리적 픽셀 미만일 때: 하단 내비게이션 바(NavigationBar) 사용   
창 너비가 600 논리적 픽셀 이상일 때: 내비게이션 레일(NavigationRail) 사용  
위와 같이 설명하고 있습니다. 중요한 점은, 이러한 선택이 기기의 '종류'가 아닌 '사용 가능한 창 크기'에 따라 이루어져야 한다는 것입니다.  

출처:
https://docs.flutter.dev/ui/adaptive-responsive/general

3. statelessWidget과 statefulWidget의 차이점  
아주 간단히 설명하자면 상태(시간에 따라 혹은 유저의 동작에 따라 변화하는 데이터)가 없을 경우에는 statelessWidget을 사용하고 상태가 있을 경우에는 statefulWidget을 사용합니다.

공식 문서상의 정의는 아래와 같습니다. 둘 다 기본적으로 abstract class이기 때문에 기본적으로 그 자체로는 객체를 가질 수 없고 반드시 상속받아서 구현할 필요가 있습니다.  
~~~ dart
abstract class StatelessWidget extends Widget
abstract class StatefulWidget extends Widget

~~~



