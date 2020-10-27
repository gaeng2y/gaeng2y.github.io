---
title:  "UIKit) 내 iOS 프로젝트를 Interface Builder 없이 만들어보자!"
excerpt: "내 프로젝트를 무거운 Interface Builder 없이 코드로 구현해보자!"

categories:
  - Blog
tags:
  - Blog
---


안녕하세요! 갱입니다.



iOS 개발을 주제로 블로그를 하게 됐습니다. 😆



저는 소프트웨어 마에스트로 11기에서 iOS 네이티브 앱 개발을 공부하고 있는 중입니다.

전부터 iOS 개발을 하고있었지만 항상 IB를 이용해서 앱 개발을 했었지만 이번 소마 프로젝트에서는 모두 코드로만 개발하기를 시작했습니다.



IB를 이용해서 개발하다가 코드로만 하니 제가 자료 검색을 못하는 건지 내용이 많이 없는 것 같아요 ㅠㅠ



그래서 프로젝트 전체를 코드로 시작할 때 가장 먼저 해야 하는 작업을 포스팅 해보려고합니다.



제가 진행하는 환경은 Xcode 12, iOS 14 입니다!



그리고 제가 하는 방법은 iOS 13 이후부터 적용 가능한 방법입니다!

iOS 13 버전 이전 방법은 많은 타블로그에 작성되어있으니 참고해주시면 될 것 같습니다!



> iOS Project Start Programmatically



1. 우선 프로젝트 내에 있는 Main.storyboard 파일을 지워주세요!

![img](http://postfiles4.naver.net/MjAyMDEwMDlfMTI4/MDAxNjAyMjUyMDEzMjEy.8zXeXTXLrAk5_m5fy9E9Hzb6krs6CBWpYi9yJb6MB2Ig.YPDoIq0U44CS4AKy5VYwbV03nYu96-7zWF7yiBb7oFYg.PNG.fover32/image.png?type=w966)

그림 1) Main.storyboard 파일 지우기



2. 그림 2에 표시되어 있는 부분의 내용을 지워주세요!



![img](http://postfiles4.naver.net/MjAyMDEwMDlfMzYg/MDAxNjAyMjUyMzMwNzIy.yjOMCrdXRTzxqYjDfZbrm6-_GtjYLiJ8_IymshxDQ9og.-ukC3WFjGoXuhmLARM5_zSdCMu7an4eXNW8G3NnZxdgg.PNG.fover32/image.png?type=w966)

그림 2) 삭제 전



![img](http://postfiles8.naver.net/MjAyMDEwMDlfMjMz/MDAxNjAyMjUyMzQ5NzY3.goAULD1Fb02XmSxPhi_5-SmFZawC3r1fF4pU2DL1aEsg.fRlt-MPvMamxzNZV-Ae5KTVXmeKlW_lG2QKVt8Pd6_cg.PNG.fover32/image.png?type=w966)

그림 3) 삭제 후



3. Info.plist 에 가서 관련 내용을 삭제한다.



![img](http://postfiles10.naver.net/MjAyMDEwMDlfNCAg/MDAxNjAyMjUyNDUwOTE0.m4SMIt59GAbsDRtK--IZPLAptImpG5zgCEefhXeqCdgg._Kn7ntKHHLIjc6JKH90JbBvkiTuvTdlG4aUubVMOZfwg.PNG.fover32/image.png?type=w966)

그림 4) Info.plist

Info.plist 파일을 보면 Application Scene Manifest -> Scene Configuration -> Application Session Role -> Item 0 -> Storyboard Name 을 지워주시면 됩니다!



1. SceneDelegate 수정

이제 SceneDelegate.swift 에서 내용을 추가해야합니다! 여기서 iOS 13 버전 이후에서 달라진 점입니다. 그 전에는 AppDelegate.swift 파일을 수정했지만 iOS 13 이후에는 SceneDelegate에서 코드를 추가해야 하더라고요... 왜 안되지 하면서 2시간 동안 헤맸던거 같습니다.😂

```javascript
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
    
}
```

scene(_ scene: session: connectionOptions:) 함수에 위와 같은 코드를 추가해주시면 됩니다!

코드를 간단히 살펴보면

우선 scene 함수에 가장 먼저 있던 코드인 guard문에서 선언한 상수의 이름을 만들어 주었습니다. 왜냐하면 guard 문에서 선언한 상수를 저희는 사용해야 합니다!

우선 window의 값을 변경해줍니다.

근데 왜 window는 앞에 let/var 키워드 안붙이나요!? 하시는 분이 있지는 않겠죠? 있으시다면 댓글 남겨주시면 알려드리겠습니다!



그리고 window의 windowScene 속성을 guard 문에서 선언한 상수를 넣어줍니다.



그리고 window의 rootViewController를 ViewController로 적용해줍니다



그리고 마지막으로 window?.makeKeyAndVisible()을 작성합니다.



해당 함수의 Apple Dev Documation을 살펴보면



![img](http://postfiles12.naver.net/MjAyMDEwMDlfMTI1/MDAxNjAyMjU0NDA2NjU0.JuogL8Gqz_Ps36ebPodvp5iyYr9vzH461C7Wa7YQeVwg.M0VYN36np3nIky7muNGZbH04eedh_7ecNfrOWmksZqAg.PNG.fover32/image.png?type=w966)

현재 창을 표시하고 같은 수준 이하의 다른 모든 창 앞에 배치하는 메소드입니다!





ViewController.swift에는 간단하게 backgroundColor만 넣어주시고 시뮬레이터를 통해 확인해보면!

![](http://postfiles13.naver.net/MjAyMDEwMDlfMjE4/MDAxNjAyMjUzMjI4NDY5.cn_BVkOlFqgdUamU4dY5S_D9Kvg-yx-aqQ5Y-Vj8IGAg.IurIKJn-C9tZvrvOcjHjv0vRDizcof6xKdZSEoYPQDAg.PNG.fover32/image.png?type=w966)

이렇게 인터페이스 빌더 없이 코드로만 만들 수 있습니다!



다른 분들이 이 글을 보시고 도움이 되셨으면 좋겠습니다!



다음 글은 UITabBarController를 코드로 작성하는 방법을 포스팅할 예정입니다!

감사합니다!

뿅 🤭
