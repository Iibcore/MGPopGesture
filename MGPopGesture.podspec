Pod::Spec.new do |s|
    s.name         = 'MGPopGesture'
    s.version      = '1.0.0'
    s.summary      = 'MGPopGesture 通过类别给 UIViewController 添加属性 mg_openPopGesture 来控制 UIViewController 是否支持侧滑返回。'
    s.homepage     = 'https://github.com/Iibcore/MGPopGesture'
    s.license      = 'MIT'
    s.authors      = {'Luqiang' => 'china.zhangluqiang@gmail.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/Iibcore/MGPopGesture.git', :tag => s.version}
    s.source_files = 'MGPopGesture/**/*.{h,m}'
    s.requires_arc = true
end
