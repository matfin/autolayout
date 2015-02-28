//
//  ViewController.m
//  AutoLayout
//
//  Created by Matthew Finucane on 28/02/2015.
//  Copyright (c) 2015 com.mattfinucane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    /**
     *     Create the three buttons
     */
    UIButton *buttonOne = [UIButton new];
    
    /**
     *     This is important. It says that the button will be laid out using autolayout
     */
    [buttonOne setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonOne setTitle:@"One" forState:UIControlStateNormal];
    [buttonOne setBackgroundColor:[UIColor redColor]];
    
    UIButton *buttonTwo = [UIButton new];
    [buttonTwo setTitle:@"Two" forState:UIControlStateNormal];
    [buttonTwo setBackgroundColor:[UIColor greenColor]];
    [buttonTwo setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *buttonThree = [UIButton new];
    [buttonThree setTitle:@"Three" forState:UIControlStateNormal];
    [buttonThree setBackgroundColor:[UIColor blueColor]];
    [buttonThree setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    /**
     *     With the buttons created, we need to add them to the viewcontrollers view
     */
    [self.view addSubview:buttonOne];
    [self.view addSubview:buttonTwo];
    [self.view addSubview:buttonThree];
    
    /**
     *     Now we can lay them out using autolayout by setting the constratints
     *     we add the constraints to the buttons parent view which is this view
     *     controllers view. This tells the parent view how to lay out its children
     *     which are the three buttons.
     *
     *     There are two ways to layout the sub views of a view.
     *
     *     1)      By attaching a constraint using a constraint with an item
     *     2)      By using the Visual Formatting Language, to attach constraints
     *             to multiple items at the same time, for convenience
     */
    
    /**
     *     We want to create a horizontal constraint and lay the three buttons out side by side
     *     We can do this using one of the ways to specify constratins.
     *
     *     We should create an NSDictionary of views which we will use in the function below it
     */
    
    NSDictionary *views = @{@"buttonOne": buttonOne, @"buttonTwo": buttonTwo, @"buttonThree": buttonThree};
    NSDictionary *metrics = @{@"buttonSpacing": @(10.0f)};
    
    
    /**
     *     This example below might seem a bit long winded, so let's break it down and see what is happening
     *
     *     In looking at the string argument provided below, this is a visual format string.
     *
     *     1) The 'H:' specifies that this is a horizontal constraint
     *     2) The '|' beside it specifies that the first view should 'hug' the parent view on the left hand side
     *     3) The '-(buttonSpacing)-' tells the constraint to give a 10 point gap between the left hand side of the
     *        the view, so it is not right up against it.
     *     4) The next bit '[buttonOne]' tells the constraint to put button one first. The string 'buttonOne' knows
     *        that it should refer to the buttonOne button because it gets matched up in the views NSDictionary
     *     5) Next up is more button spacing. As with step three, this will put a 10 point gap between button one and button two.
     *     6) In the next steps, we add button two and then a 10 point gap, and then button three with a ten point gap
     *     7) Finally, the ending '|' tells the constraint to pin buttonThree to the right hand edge of the view.
     *     8) Note the metrics NSDictionary above. This is so we can map a meaningful name to a value, in this case, 10 points.
     */
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonSpacing)-[buttonOne]-(buttonSpacing)-[buttonTwo(==buttonOne)]-(buttonSpacing)-[buttonThree(==buttonTwo)]-(buttonSpacing)-|" options:0 metrics:metrics views:views]];
    
    
    /**
     *     Add a constraint to each button to vertically center it
     *     So let's break this down and see what is happening
     *
     *     1) We are adding a constraint to the view controllers view for buttonOne using an item constraint
     *     2) We are setting the constraint with the item buttonOne
     *     3) So what type of constraint is it? In this case, the centre Y layout constraint,
     *        and this will place the button vertically in the middle of its parent view.
     *     4) We set the relation, saying it should be equal
     *     5) We set the relationship to the parent view, saying "I want my attribute to be equal to that of what is in the toItem: parameter"
     *     6) We specify the same attribute to ensure the buttons vertical alignment is the same as the parent
     *     7) We set the multiplier as 1.0f. If we set it to 0.5f, the button would appear in the top quarter of the screen and not half way down.
     *     8) We set the constant value to 0 to get the button dead centre. If we wanted it dead center plus 10 points down, we could set this value to 10.0f.
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonOne attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    /**
     *     Let's add this constraint to the other buttons
     */
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonTwo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonThree attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    
    /**
     *     Setting a 32 point height for the buttons is carried out below.
     *     Notice the toItem: and second attribute: params are set to nil and NSLayoutAttributeNotAnAttribute.
     *     This is because the button should not depend on its parent view to get the height, here we set it explicitely.
     *     The last constant: parameter will set the button height to 32 points.
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonOne attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:32.0f]];
    
    /**
     *     Add this constraint to the other two buttons
     */
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonTwo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:32.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonThree attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:32.0f]];
    
    /**
     *     Now we are done.
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
