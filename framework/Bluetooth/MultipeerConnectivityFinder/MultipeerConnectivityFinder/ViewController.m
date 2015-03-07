//
//  ViewController.m
//  MultipeerConnectivityFinder
//
//  Created by xidanjueying on 15/3/5.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property MCSession *session;
@property MCBrowserViewController *browserController;
@property UIImagePickerController *imagePicker;
@property UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBar];
    [self initImageView];
    [self initSession];
}

- (void)initNavBar {
    UINavigationItem *navitem = [[UINavigationItem alloc] initWithTitle:@"发现"];
    navitem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查找设备" style:UIBarButtonItemStylePlain target:self action:@selector(findService:)];
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

- (void)initSession {
    // 创建节点
    MCPeerID *peerid = [[MCPeerID alloc] initWithDisplayName:@"xidanjueying's simulator"];
    // 创建会话
    self.session = [[MCSession alloc] initWithPeer:peerid];
    self.session.delegate = self;
}

#pragma mark - 按钮操作
// 查找服务
- (void)findService:(id)sender {
    self.browserController = [[MCBrowserViewController alloc] initWithServiceType:@"cmj-stream" session:self.session];
    self.browserController.delegate = self;
    [self presentViewController:self.browserController animated:YES completion:nil];
}

// 选择照片
- (void)selectPhoto:(id)sender {
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

#pragma mark - MCBrowserViewController
- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    NSLog(@"已选择");
    [self.browserController dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    NSLog(@"已取消查找");
    [self.browserController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {
    
}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {
    
}

- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {
    
}

#pragma mark - UIImagePickerController代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    
    // 发送数据给所有已连接设备
    NSError *error = nil;
    [self.session sendData:UIImagePNGRepresentation(image) toPeers:[self.session connectedPeers] withMode:MCSessionSendDataUnreliable error:&error];
    
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"发送数据");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
}

@end
