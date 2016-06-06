# CTButtonInsets

Give up the property ```imageEdgeInsets``` and ```titleEdgeInsets``` when you want to set a UIButton's titltLabel and imageView . It is difficult and  you will feel that you are really fucking a dog (Chinese slang) when you  do this in this way because there will be  some problems you cannot control .So just abandon it ,this category can sovle this problem perfectly.

### How does it work
When I was looking for the solution about this issue,I noticed that there declare two methods in the ```UIButton.h```
	
*  -(CGRect)titleRectForContentRect:(CGRect)contentRect;
*  -(CGRect)imageRectForContentRect:(CGRect)contentRect;
	
The two methods description goes :


```
Returns the rectangle in which the receiver draws its title.

Returns the rectangle in which the receiver draws its image.

```

Then I add two properties ```titleRect``` and ```imageRect```, and  rewrite the  two methods in the  category ,it do work.

But there still have a problem.You must have many buttons in your project, those two methods you rewrite has covered the system methods. So if the other buttons do not set the two properties you added in the category,it will still call those two methods you rewrite.These button's ```titleLabel``` and ```imageView``` will show noting because its RECT is empty.


So I use method swizzling to solve this problem.To distinguish wether I set the ```titleRect``` and ```imageRect```,if I set ,return it;if I don't ,call the system methods.

```
- (CGRect)swizzle_imageRectForContent:(CGRect)contentRect{
    if (!CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    
    return [self swizzle_imageRectForContent:contentRect];
}

- (CGRect)swizzle_titleRectForContent:(CGRect)contentRect{
    if (!CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    
    return [self swizzle_titleRectForContent:contentRect];
}

```

See more details ,download and star please.

#^_^#







