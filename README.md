Sizenfit-iOS-SDK

We have included all the Size n Fit widget files as an iOS library.  Please include this in your project and it should work.

Here are the detailed instructions.

1. Unzip and copy all the files including the assets and include folder to the root folder of the project.
    (3 types of files are present - i.e, assets folder , an .a file which is a library and the include folder)
    
2. Make the following 2 changes in the project settings for the library.

    a. Go to project-->BuildSetting-->other Linker Flags add -ObjC.
    
    b. Add the swift latest version to project
        (project-->buildsetting-->swift langauge version-->4.2)
                
3. On the pdp page(product display page or the page where you want to show the widget) import the following file. 

    "HeightWeightCalculationViewController.h" (you will find this file in the include folder)
    
    
4. Once the file is imported create a button on the pdp page (or any other as mentioned above)
    On click of the button execute the following code-
    a. For objectiveC developers:-
    
            [self.navigationController.navigationBar setHidden:YES];
            UIViewController *mainController = [[HeightWeightCalculationViewController alloc] initWithNibName:@"HeightWeightCalculationViewController" bundle:nil];
            HeightWeightCalculationViewController *htWt = [[HeightWeightCalculationViewController alloc]initWithNibName:@"HeightWeightCalculationViewController" bundle:nil];
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:htWt];
            nav.navigationBar.hidden = YES;
            [self addChildViewController:nav];
            [self.view addSubview:nav.view];
            mainController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,
                                                  [UIScreen mainScreen].bounds.size.height);
            [nav didMoveToParentViewController:self];
    
    b. For swift developers:-
    
        You can use the above code structure as a reference to invoke the Size n Fit library files.  Please contact us if you run into any issues or need any support.

