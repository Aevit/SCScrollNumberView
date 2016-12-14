# SCScrollNumberView

## Description
show number with scroll animation

## Preview
![image](https://raw.githubusercontent.com/Aevit/SCScrollNumberView/master/scroll_number.gif)   

## Usage

### install
`pod 'SCScrollNumberView'`  

### how to use  

* import  

	```
	#import <SCScrollNumberView.h>
	```

* init
 
	```
	SCScrollNumberView  *scrollNumberView = [[SCScrollNumberView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
	```

* set a number and start to scroll

	```
	self.scrollNumberView.number = @4782;
	[self.scrollNumberView startAnimation];
	```
	
* other optional properties

	```
	/**
	 the number will to scroll
	 */
	@property (nonatomic, strong) NSNumber *number;
	
	/**
	 default: [UIFont systemFontOfSize:14]
	 */
	@property (nonatomic, strong) UIFont *font;
	
	/**
	 default: [UIColor darkGrayColor]
	 */
	@property (nonatomic, strong) UIColor *textColor;
	
	/**
	 scroll up or down, default: YES
	 */
	
	@property (nonatomic, assign) BOOL isScrollUp;
	
	/**
	 row number to scroll, default: 5
	 */
	@property (nonatomic, assign) NSInteger scrollLineNum;
	
	/**
	 animation duration, default: 1.5
	 */
	@property (nonatomic, assign) CFTimeInterval duration;
	
	/**
	 animation duration gap, default: 0.2
	 */
	@property (nonatomic, assign) CFTimeInterval durationOffset;
	
	/**
	 the columns will NOT scroll. eg. [NSMutableSet setWithObjects:@0, @1, nil]; default: empty set.
	 */
	@property (nonatomic, strong) NSMutableSet *exceptAnimIndexSet;
	```
	
	
## License

This code is distributed under the terms and conditions of the [MIT license](https://raw.githubusercontent.com/Aevit/SCScrollNumberView/master/LICENSE). 