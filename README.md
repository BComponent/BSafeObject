# BSafeObject

[![CI Status](https://img.shields.io/travis/1250829271@qq.com/BSafeObject.svg?style=flat)](https://travis-ci.org/1250829271@qq.com/BSafeObject)
[![Version](https://img.shields.io/cocoapods/v/BSafeObject.svg?style=flat)](https://cocoapods.org/pods/BSafeObject)
[![License](https://img.shields.io/cocoapods/l/BSafeObject.svg?style=flat)](https://cocoapods.org/pods/BSafeObject)
[![Platform](https://img.shields.io/cocoapods/p/BSafeObject.svg?style=flat)](https://cocoapods.org/pods/BSafeObject)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BSafeObject is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/BComponent/BSpecs.git'
pod 'BSafeObject'
```
## 0.1.1
### 使用说明
1、直接pod项目不需要添加任何代码就可实现防奔溃功能
2、只有relase环境会执行该库的功能，debug不执行


## 0.1.2
### 使用说明
1、只有relase环境会执行该库的功能，debug不执行
2、在AppDelegate中导入 #import <BSafeObject.h>
3、执行初始化代码
```BSafeConfig * faseConfig = [BSafeConfig new];
 [BSafe starWithConfig:faseConfig];
```
4、如果要监听崩溃日志
```faseConfig.threadStackBlock = ^(NSString * _Nonnull exception, NSString * _Nonnull reason) {
  NSLog(@"exception == %@",exception);
};
```

## 异常说明
方法不存在异常：NoSuchMethodException:Unrecognized Selector Sent to Instance
调用属性不存在: NullParamterException:Unrecognized Selector Sent to Instance
数组越界异常、字符串下标越界异常: IndexOutOfBoundsException:Out of bound
key-value参数异常 nil: NullKeyValueException:Attempt to insert nil value
## Author

1250829271@qq.com, wangbaoming@log56.com

## License

BSafeObject is available under the MIT license. See the LICENSE file for more info.
