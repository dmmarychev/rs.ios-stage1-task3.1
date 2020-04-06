#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) NSSet *validationSet;

@property (weak, nonatomic) UIView *sviewResultColor;
@property (weak, nonatomic) UILabel *labelResultColor;
@property (weak, nonatomic) UITextField *textFieldRed;
@property (weak, nonatomic) UITextField *textFieldGreen;
@property (weak, nonatomic) UITextField *textFieldBlue;

@end


@implementation ViewController

#pragma mark - UIView lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSMutableSet *numbers = [[NSMutableSet alloc] init];
    
    for (int i = 0; i <= 255; i++) {
        [numbers addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    self.validationSet = numbers;
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.accessibilityIdentifier = @"mainView";
    [self.view addSubview:view];
    
    UILabel *labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 150, 70)];
    labelResultColor.accessibilityIdentifier = @"labelResultColor";
    labelResultColor.text = @"Color";
    [self.view addSubview:labelResultColor];
    self.labelResultColor = labelResultColor;
    
    UIView *sviewResultColor = [[UIView alloc] initWithFrame:CGRectMake(150, 90, 250, 30)];
    sviewResultColor.layer.borderWidth = 1.f;
    sviewResultColor.layer.borderColor = [[UIColor blackColor] CGColor];
    sviewResultColor.accessibilityIdentifier = @"viewResultColor";
    sviewResultColor.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sviewResultColor];
    self.sviewResultColor = sviewResultColor;
    
    UILabel *labelRed = [[UILabel alloc] initWithFrame:CGRectMake(20, 125, 70, 100)];
    labelRed.accessibilityIdentifier = @"labelRed";
    labelRed.text = @"RED";
    [self.view addSubview:labelRed];
    
    UITextField *textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(100, 160, 300, 30)];
    textFieldRed.accessibilityIdentifier = @"textFieldRed";
    textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    textFieldRed.placeholder = @"0..255";
    [self.view addSubview:textFieldRed];
    self.textFieldRed = textFieldRed;
    self.textFieldRed.delegate = self;
    
    UILabel *labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(20, 195, 70, 100)];
    labelGreen.accessibilityIdentifier = @"labelGreen";
    labelGreen.text = @"GREEN";
    [self.view addSubview:labelGreen];
    
    UITextField *textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(100, 230, 300, 30)];
    textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    textFieldGreen.placeholder = @"0..255";
    [self.view addSubview:textFieldGreen];
    self.textFieldGreen = textFieldGreen;
    self.textFieldGreen.delegate = self;
    
    UILabel *labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(20, 265, 70, 100)];
    labelBlue.accessibilityIdentifier = @"labelBlue";
    labelBlue.text = @"BLUE";
    [self.view addSubview:labelBlue];
    
    UITextField *textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(100, 300, 300, 30)];
    textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    textFieldBlue.placeholder = @"0..255";
    [self.view addSubview:textFieldBlue];
    self.textFieldBlue = textFieldBlue;
    self.textFieldBlue.delegate = self;

    UIButton *buttonProcess = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonProcess.accessibilityIdentifier = @"buttonProcess";
    [buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    
    buttonProcess.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 35, 350, 70, 70);
    [self.view addSubview:buttonProcess];
    
    [buttonProcess addTarget:self action:@selector(buttonProcessPressedAction:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - Actions

- (void)buttonProcessPressedAction:(UIButton *)sender {
    
    if ([self isTextColorValide:self.textFieldRed.text] &&
        [self isTextColorValide:self.textFieldGreen.text] &&
        [self isTextColorValide:self.textFieldBlue.text]) {
        
        float R = [self.textFieldRed.text floatValue] / 255.f;
        float G = [self.textFieldGreen.text floatValue] / 255.f;
        float B = [self.textFieldBlue.text floatValue] / 255.f;
        
        NSString *colorInHex = [NSString stringWithFormat:@"0x%02X%02X%02X", [self.textFieldRed.text intValue],
                                                                             [self.textFieldGreen.text intValue],
                                                                             [self.textFieldBlue.text intValue]];

        self.sviewResultColor.backgroundColor = [UIColor colorWithRed:R green:G blue:B alpha:1.f];
        self.labelResultColor.text = colorInHex;
        
    } else {
        self.labelResultColor.text = @"Error";
        self.sviewResultColor.backgroundColor = [UIColor whiteColor];
    }
    
    [self.textFieldRed resignFirstResponder];
    [self.textFieldGreen resignFirstResponder];
    [self.textFieldBlue resignFirstResponder];
    self.textFieldRed.text = self.textFieldGreen.text = self.textFieldBlue.text = @"";
}


#pragma mark - Validation

- (BOOL)isTextColorValide:(NSString *)textForValidation {
    
    return [self.validationSet containsObject:textForValidation] ? YES : NO;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (![self.labelResultColor.text isEqualToString:@"Color"]) {
        
        self.labelResultColor.text = @"Color";
        self.sviewResultColor.backgroundColor = [UIColor whiteColor];
    }
    
    return YES;
}

@end
