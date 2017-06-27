# FAAutoLayout

[![CI Status](http://img.shields.io/travis/fabioalmeida/FAAutoLayout.svg?style=flat)](https://travis-ci.org/fabioalmeida/FAAutoLayout)
[![Version](https://img.shields.io/cocoapods/v/FAAutoLayout.svg?style=flat)](http://cocoapods.org/pods/FAAutoLayout)
[![License](https://img.shields.io/cocoapods/l/FAAutoLayout.svg?style=flat)](http://cocoapods.org/pods/FAAutoLayout)
[![Platform](https://img.shields.io/cocoapods/p/FAAutoLayout.svg?style=flat)](http://cocoapods.org/pods/FAAutoLayout)

FAAutoLayout is a compact [Auto Layout](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/index.html) library for iOS. It's built on top of [NSLayoutConstraint](https://developer.apple.com/documentation/uikit/nslayoutconstraint), extending the capabilities of UIView allowing developers to intuitively create constraints programmatically - the same way they do it using the interface builder.

This lightweight library was designed thinking about the people who like to create their interfaces without using storyboards of XIB files, helping to remove the excess of boilerplate code when it comes to defining the layout constraints.

The naming used was thought to make the library adoption super fast to everyone that is already used to add constraints using the interface builder. For more detailed examples please check the [Usage](#usage) section.


## Requirements

The minimum requirements needed to use `FAAutoLayout` are:
- iOS 8.0
- Xcode 8
- Obj-C and Swift compatible


## Installation

You can use [CocoaPods](http://cocoapods.org) to add `FAAutoLayout` to your project. To install it, simply specify it in your **Podfile**:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'TargetName' do
  pod 'FAAutoLayout'
end
```

After specifying the new dependency on the podfile, just run `pod install` to make sure you install the latest version of the library.


## Usage

To import the library to your project just add the following line to your Swift file:

```swift
import FAAutoLayout
```

If you have a view that you want to add to your UIViewController and make it fill the container in all the margins, you just need to do the following:

```swift
let backgroundView = UIView()
backgroundView.backgroundColor = .lightGray
self.view.addSubview(backgroundView)

// with only one line of code all the 4 needed constraints are automatically added to the view
backgroundView.fillContainer()
```

For adding a view with a fixed width and height that sits on the top-left corner of the view:

```swift
let topLeftView = UIView()
topLeftView.backgroundColor = .blue
backgroundView.addSubview(topLeftView)

topLeftView.constrainLeadingSpaceToContainer()
topLeftView.constrainTopSpaceToContainer(10)
topLeftView.constrainWidth(150)
topLeftView.constrainHeight(45)
```

If we want to define relations between two views on the same hierarchy level (i.e. share the same `superview`) we can define, for instance, one horizontal spacing constraint between them:

```swift
let topRightView = UIView()
topRightView.backgroundColor = .red
backgroundView.addSubview(topRightView)

topRightView.constrainHorizontalSpacing(toView: topLeftView, constant: 20)
topRightView.constrainTopSpaceToContainer(10)
topRightView.constrainTrailingSpaceToContainer(30)
topRightView.constrainEqualHeight(toView: topLeftView, constant: 0, relation: .equal, priority: UILayoutPriorityRequired, multiplier: 2)
```

Note that in the previous example the height was not a fixed value but calculated using the first view height and a multiplier.

It's always possible to store an added constraint to be later changed:

```swift
let heightConstraint = topLeftView.constrainHeight(45)
// (...)
heightConstraint.constant = 80
```

On the previous examples, lots of constraints were being added in relation with a container view. Nevertheless, it is also possible to create these relations to other view that is above on the container view hierarchy chain:

```swift
// container view that will sit below topLeftView
let containerView1 = UIView()
containerView1.backgroundColor = .green
backgroundView.addSubview(containerView1)

containerView1.constrainWidth(200)
containerView1.constrainHeight(200)
containerView1.constrainVerticalSpacing(toView: topLeftView, constant: 100)
containerView1.constrainLeadingSpaceToContainer(10)

// view that will adapt to containerView1
let containerView2 = UIView()
containerView2.backgroundColor = .black
containerView1.addSubview(containerView2)

containerView2.fillContainer(40)

// view that that despite being inside containerView2, will adapt to containerView1
let containerView3 = UIView()
containerView3.backgroundColor = .orange
containerView3.alpha = 0.5
containerView2.addSubview(containerView3)

// here, even though containerView2 is the container for containerView3, we can make a relation to containerView1 since it the the superview of containerView2
containerView3.fill(view: containerView1, constant: 20)
```

The final result would be something similar to the following image:

![example1](https://user-images.githubusercontent.com/474965/27563323-c92a855c-5ac8-11e7-9ea1-3e7e933ff710.png)

In some other cases we need to create our views programmatically because their number might be dynamic depending on some business logic. On the next example you can see 2 `UIView` class methods that allow to add constraints to an Array of UIViews with one single function call:

```swift
let dynamicNumberOfViews = 5
var dynamicViews = [UIView]()

for _ in 0..<dynamicNumberOfViews {

    let newView = UIView()
    newView.backgroundColor = .blue
    dynamicViews.append(newView)
    self.view.addSubview(newView)

    // add constraints
    newView.constrainHeight(50)
    newView.constrainTopSpaceToContainer(15)
}

// as you can see here, these methods are not called on some UIView instance but are UIView class methods
UIView.constrainEqualWidth(dynamicViews)
UIView.constrainEqualHorizontalSpacing(dynamicViews, constant: 30)

dynamicViews.first?.constrainLeadingSpaceToContainer(15)
dynamicViews.last?.constrainTrailingSpaceToContainer(15)
```

This would create a view like the following:

![example2](https://user-images.githubusercontent.com/474965/27563324-c92c0756-5ac8-11e7-94f1-8f9bdf3083d8.png)


All these examples can be found on the repository "Examples" project.


## Structure

The main types of constraints you can add are the following:

- Leading
- Trailing
- Top
- Bottom
- Width
- Height
- Center (Middle/Vertical/Horizontal)
- Fill
- Spacing (Vertical/Horizontal)

In almost all the methods you can specify several parameters like `constant`, `multiplier`, `relation` or `priority`. However, for an easy code reading and avoid boilerplating, the general rule is that all the parameters have **default values**.

This means that for the most regular cases, if for instance you want to constrain the view top to the container, you can do the following:

```swift
myView.constrainTopSpaceToContainer()
```

But you can also specify a constant if you want to add a margin:

```swift
myView.constrainTopSpaceToContainer(20)
```

However, if you want to specify the other parameters like the `NSLayoutRelation` or `UILayoutPriority` you can also do the following in only one line:

```swift
myView.constrainTopSpaceToContainer(20, relation: .greaterThanOrEqual, priority: UILayoutPriorityRequired, multiplier: 0.7)
```


## Author

If you want to get in touch, reach me on twitter: [@fabioacalmeida](https://twitter.com/fabioacalmeida)


## License

FAAutoLayout is available under the MIT license. See the LICENSE file for more info.
