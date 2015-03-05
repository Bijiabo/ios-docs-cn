//
//  ViewController.m
//  MultipeerConnectivityDemo
//
//  Created by xidanjueying on 15/3/4.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property MCSession *session;
@property MCAdvertiserAssistant *assistant;
@property UIImagePickerController *imagePicker;
@property UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBar];
    [self initImageView];
    [self initAdvertiser];
}

- (void)initAdvertiser {
    // 创建节点, displayName用于提供给周边设备查看
    MCPeerID *peerid = [[MCPeerID alloc] initWithDisplayName:@"xidanjueying's iphone5"];
    self.session = [[MCSession alloc] initWithPeer:peerid];
    self.session.delegate = self;
    
    // 创建广播
    self.assistant = [[MCAdvertiserAssistant alloc] initWithServiceType:@"cmj-stream" discoveryInfo:nil session:self.session];
    self.assistant.delegate = self;
}

- (void)initNavBar {
    UINavigationItem *navitem = [[UINavigationItem alloc] initWithTitle:@"广播"];
    navitem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开始广播" style:UIBarButtonItemStylePlain target:self action:@selector(broadcast:)];
    navitem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择照片" style:UIBarButtonItemStylePlain target:self action:@selector(selectPhoto:)];
    
    UINavigationBar *navbar = [[UINavigationBar alloc] init];
    navbar.frame = CGRectMake(0, 0, self.view.frame.size.width, 60);
    navbar.items = @[navitem];
    
    [self.view addSubview:navbar];
}

- (void)initImageView {
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
}

// 开始广播
- (void)broadcast:(id)sender {
    [self.assistant start];
}

// 选择照片
- (void)selectPhoto:(id)sender {
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

#pragma mark - MCSession代理方法
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
    switch (state) {
        case MCSessionStateConnected:
            NSLog(@"连接成功");
            break;
            
        case MCSessionStateConnecting:
            NSLog(@"正在连接...");
            break;
            
        default:
            NSLog(@"连接失败");
            break;
    }
}

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
    NSLog(@"接收数据");
    self.imageView.image = [UIImage imageWithData:data];
}

- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {
    
}

- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {
    
}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {
    
}

#pragma mark - UIImagePickerController代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    
    // 将照片数据发送给所有已连接设备
    NSError *error = nil;
    [self.session sendData:UIImagePNGRepresentation(image) toPeers:[self.session connectedPeers] withMode:MCSessionSendDataUnreliable error:&error];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"开始发送数据");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
