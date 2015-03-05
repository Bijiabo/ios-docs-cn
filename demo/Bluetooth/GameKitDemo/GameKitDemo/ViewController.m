//
//  ViewController.m
//  GameKitDemo
//
//  Created by xidanjueying on 15/2/10.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// 照片视图
@property UIImageView *imageview;
// 蓝牙连接会话，ios 7.0开始已废弃
@property GKSession *session;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavbar];
    [self initImageView];
    [self initBluetoothDeviceSearch];
}

- (void)initNavbar {
    UIBarButtonItem *openButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(selectClick:)];
    UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(sendClick:)];
    UINavigationBar *navbar = [[UINavigationBar alloc] init];
    UINavigationItem *navitem = [[UINavigationItem alloc] init];
    
    navbar.frame = CGRectMake(0, 0, self.view.frame.size.width, 60);
    navbar.items = @[navitem];
    navitem.leftBarButtonItem = openButton;
    navitem.rightBarButtonItem = sendButton;
    
    [self.view addSubview:navbar];
}

- (void)initImageView {
    self.imageview = [[UIImageView alloc] init];
    self.imageview.frame = CGRectMake(0, 61, self.view.frame.size.width, self.view.frame.size.height - 61);
    [self.view addSubview:self.imageview];
}

- (void)initBluetoothDeviceSearch {
    GKPeerPickerController *pearPickerController = [[GKPeerPickerController alloc] init];
    pearPickerController.delegate = self;
    [pearPickerController show];
}

- (void)selectClick:(UIBarButtonItem *)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)sendClick:(UIBarButtonItem *)sender {
    NSData *data = UIImagePNGRepresentation(self.imageview.image);
    [self.session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:nil];
}

// 蓝牙数据接收方法
- (void)receiveData:(NSData *)data fromPeer:(NSString *)peer inSession:(GKSession *)session context:(void *)context {
    UIImage *image = [UIImage imageWithData:data];
    self.imageview.image = image;
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

#pragma mark - GKPeerPickerController代理方法
/**
 *  连接到某个设备
 *
 *  @param picker  蓝牙点对点连接控制器
 *  @param peerID  连接设备蓝牙传输ID
 *  @param session 连接会话
 */
- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session {
    NSLog(@"已连接客户端设备:%@.",peerID);
    self.session = session;
    // 设置数据接收处理句柄，相当于代理，一旦数据接收完成调用它的-receiveData:fromPeer:inSession:context:方法处理数据
    [self.session setDataReceiveHandler:self withContext:nil];
    // 一旦连接成功关闭窗口
    [picker dismiss];
}

#pragma mark - UIImagePickerController代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.imageview.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
