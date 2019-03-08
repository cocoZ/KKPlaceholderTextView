# KKPlaceholderTextView
===
[![](https://img.shields.io/badge/pod-1.0-orange.svg)](https://cocoapods.org/pods/KKPlaceholderTextView) [![](https://img.shields.io/badge/blog-简书-E87040.svg)]()

支持placeholder的UITextView, 简化设置TextView内边距

代码示例
-----

```objectivec
    KKPlaceholderTextView *testTF = [[KKPlaceholderTextView alloc] initWithFrame:CGRectMake(50, 100, 100, 50)];
    testTF.placeholder = @"请输入描述内容";
    NSDictionary * attributesDic = @{ NSFontAttributeName:[UIFont boldSystemFontOfSize:12],
                                        NSForegroundColorAttributeName:[UIColor redColor]
                                        };
    testTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入描述内容" attributes:attributesDic];
    //  设置textView 内边距
    testTF.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.view addSubview:testTF];
```

Cocoapods
----
全部控件构造方法扩展(推荐):
```objectivec
pod 'KKPlaceholderTextView'
```

blog
----
简书：[更新中。。。]()
