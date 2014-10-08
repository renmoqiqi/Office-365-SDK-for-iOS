//
//  MessageTableViewController.m
//  simple-exchange-app
//
//  Created by Gustavo on 8/21/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "MessageTableViewController.h"
#import <office365_exchange_sdk/EntityContainerClient.h>
#import <office365_odata_impl/MSODefaultDependencyResolver.h>
#import <office365_odata_impl/MSOBasicCredentials.h>
#import <office365_odata_impl/MSOCredentialsImpl.h>
#import <office365_exchange_sdk/Recipient.h>
#import <office365_exchange_sdk/EmailAddress.h>

@interface MessageTableViewController ()

@property NSString *Token;
@property NSArray *Messages;

@end

@implementation MessageTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
        if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getMessagesFromInbox];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    
    Message *message = (Message*)[self.Messages objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",message.Sender.EmailAddress.Name, message.Subject];
    
    return cell;
}

-(void)getMessagesFromInbox{
 
    MSODefaultDependencyResolver* resolver = [MSODefaultDependencyResolver alloc];
    MSOBasicCredentials* credentials = [MSOBasicCredentials alloc];
    [credentials addToken:@"di1ndWhhbnNAbXNvcGVudGVjaC5jY3NjdHAubmV0OkFEQ0dhaDE0ODc="];
    
    MSOCredentialsImpl* credentialsImpl = [MSOCredentialsImpl alloc];
    [credentialsImpl setCredentials:credentials];
    [resolver setCredentialsFactory:credentialsImpl];
    
    EntityContainerClient* client = [[EntityContainerClient alloc] initWit:@"https://sdfpilot.outlook.com/ews/odata" : resolver];
    
    NSURLSessionTask* task = [[[client getMe] getMessages] execute:^(id messages, NSURLResponse *r, NSError *e) {
        if(e == nil){
            self.Messages = (NSArray<Message>*)messages;
            [self.tableView reloadData];
        }
    }];
    
    [task resume];
}

- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
    
}

@end