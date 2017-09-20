Pod::Spec.new do |s|


  s.name         = "YDBCustomBabyBluetooth"
  s.version      = "1.0.4"
  s.summary      = "bluetooth library on ios"

  s.description  = <<-DESC
                   he easiest way to use Bluetooth (BLE)in ios,even bady can use . 一个非常容易使用的蓝牙库.
                   DESC

  s.homepage     = "https://github.com/PaulLiGe/BabyBluetooth"

  s.license      = "MIT"
  s.source       = { :git => "https://github.com/PaulLiGe/BabyBluetooth.git", :tag => s.version }
  s.author          = { 'PaulLiGe' => 'paullige@foxmail.com' }
  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files  = "Classes", "Classes/objc/*.{h,m}"

end
