//
//  DashboardViewController.m
//  PlayWithText
//
//  Created by Khushboo Sharma on 9/26/14.
//  Copyright (c) 2014 Razorfish. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()<AVSpeechSynthesizerDelegate>
{
    AVSpeechUtterance *utterance;
}


@property (weak, nonatomic) IBOutlet UITextField *txtField;

-(IBAction)Neutral:(id)sender;
-(IBAction)sad:(id)sender;
-(IBAction)Anger:(id)sender;
-(IBAction)Happy:(id)sender;



@end




@implementation DashboardViewController


BOOL speechPaused = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.synthesizer = [[AVSpeechSynthesizer alloc]init];
    speechPaused = NO;
    self.synthesizer.delegate = self;
    
}




-(IBAction)Neutral:(id)sender
{
 
   
    
}

-(IBAction)sad:(id)sender
{
    utterance = [[AVSpeechUtterance alloc]initWithString:self.txtField.text];
    
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    utterance.pitchMultiplier = 0.5;
    utterance.rate = AVSpeechUtteranceMinimumSpeechRate/2;
    utterance.volume = 0.2;
    
    [self.synthesizer speakUtterance:utterance];
}

-(IBAction)Anger:(id)sender
{
    utterance = [[AVSpeechUtterance alloc]initWithString:self.txtField.text];
    
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    utterance.pitchMultiplier = 2.0;
    utterance.rate = AVSpeechUtteranceMaximumSpeechRate/2;
    utterance.volume = 1.0;
    
    
    [self.synthesizer speakUtterance:utterance];
}

-(IBAction)Happy:(id)sender
{
    utterance = [[AVSpeechUtterance alloc]initWithString:self.txtField.text];
    
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    utterance.pitchMultiplier = 1.0;
    utterance.rate = AVSpeechUtteranceDefaultSpeechRate/2;
//    utterance.po
    utterance.volume = 0.4;
    NSLog(@"utterence %@",utterance);
    [self.synthesizer speakUtterance:utterance];
}


- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterances{
    
    // Get the text
    NSString *text = [utterances speechString];
    
    // apply attribute
    
    NSMutableAttributedString * all = [[NSMutableAttributedString alloc] initWithString:text];
    [all addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:characterRange];
    
    // set the attributed text to textView
    
    [_txtField setAttributedText:all];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //    NSLog(@"txtAM%@",txtFieldAnnualPremium.text);
    //    NSLog(@"txtpolicyTerm%@",txtFieldPolicyTerm.text);
    //    NSLog(@"textField%li",(long)textField.tag);
    //
    
    //    policyTerm = txtFieldPolicyTerm.text;
    //    PT = [policyTerm intValue];
    //    NSLog(@"PT%i",PT);
    
    
    //    annaualPremium = txtFieldAnnualPremium.text;
    //    NSLog(@"annaualPremium%@",annaualPremium);
    
    
    
    [textField resignFirstResponder];
    
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
