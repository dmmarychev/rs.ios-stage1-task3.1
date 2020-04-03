#import "ViewController.h"

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.accessibilityIdentifier = @"mainView";
    [self.view addSubview:view];
    
    UITextField *textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(170, 80, 150, 30)];
    textFieldRed.accessibilityIdentifier = @"textFieldRed";
    textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    textFieldRed.placeholder = @"0..255";
    [self.view addSubview:textFieldRed];
    
    [self.view addSubview:textFieldRed];
    
    UITextField *textFieldGreen = [[UITextField alloc] init];
    textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    
    UITextField *textFieldBlue = [[UITextField alloc] init];
    textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    
    UIButton *buttonProcess = [[UIButton alloc] init];
    buttonProcess.accessibilityIdentifier = @"buttonProcess";
    
    UILabel *labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 150, 100)];
    labelResultColor.accessibilityIdentifier = @"labelResultColor";
    labelResultColor.text = @"RESULT COLOR";
    [self.view addSubview:labelResultColor];
    
    UILabel *labelRed = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 150, 100)];
    labelRed.accessibilityIdentifier = @"labelRed";
    labelRed.text = @"RED";
    [self.view addSubview:labelRed];
    
    UILabel *labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 150, 100)];
    labelGreen.accessibilityIdentifier = @"labelGreen";
    labelGreen.text = @"GREEN";
    [self.view addSubview:labelGreen];

    
    UILabel *labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 150, 100)];
    labelBlue.accessibilityIdentifier = @"labelBlue";
    labelBlue.text = @"BLUE";
    [self.view addSubview:labelBlue];

    
    
    
    UIView *sviewResultColor = [[UIView alloc] initWithFrame:CGRectMake(70, 40, 150, 30)];
    sviewResultColor.accessibilityIdentifier = @"viewResultColor";
    [self.view addSubview:sviewResultColor];
}

@end
