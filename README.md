# list-panel

`list-panel` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 毛玻璃列表容器组件，适合包裹设置项、记录列表、任务列表和分组内容。默认提供半透明纯色玻璃、细边框、柔和阴影和顶部高光，业务方可以自定义颜色、宽高、圆角、边框、阴影和内边距。

## 实际运行效果

下面展示毛玻璃列表面板和多行内容承载效果：

![list panel preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/list-panel@main/docs/list-panel-preview.gif)

## 安装

```bash
ohpm install @kaworunagisa_hhl/list-panel
```


## 正常使用样式

```ts
import { SwiftUIListPanel } from '@kaworunagisa_hhl/list-panel'
import { SwiftUITone } from '@kaworunagisa_hhl/theme'

@Builder
function RecordsContent() {
  Column({ space: 0 }) {
    Text('血压记录')
      .fontSize(16)
      .fontWeight(FontWeight.Bold)
      .padding(12)

    Divider()

    Text('08:30  122/78 mmHg')
      .fontSize(14)
      .padding(12)
  }
  .width('100%')
}

@Component
struct RecordsPanel {
  build() {
    SwiftUIListPanel({
      tone: SwiftUITone.GlassBlack,
      contentBuilder: RecordsContent
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIListPanel({
  componentWidth: '88%',
  componentHeight: 'auto',
  spacing: 0,
  fillColor: '#E6111111',
  tintColor: '#1FFFFFFF',
  customBorderColor: '#33FFFFFF',
  customBorderWidth: 1.1,
  cornerRadius: 8,
  contentPadding: 8,
  shadowColor: '#66000000',
  shadowRadius: 16,
  contentBuilder: RecordsContent
})
```

## SwiftUI 风格链式配置

```ts
import { swiftUIConfig, SwiftUITone } from '@kaworunagisa_hhl/theme'

const glassStyle = swiftUIConfig()
  .withTone(SwiftUITone.SystemGray)
  .withWidth('92%')
  .withHeight('auto')
  .withRadius(8)
  .withFillColor('#E6111111')
  .withTintColor('#22FFFFFF')
  .withBorder('#33FFFFFF', 1)
  .withShadow('#33000000', 16)
  .withPadding(12)

SwiftUIListPanel({
  config: glassStyle
})
```

`config` 是可选入口，适合复用一组 SwiftUI modifier 风格的外观配置；原有直接传参方式仍然可用，且业务可以继续通过 Builder 注入自定义内容。

## 示例目录

完整最小示例见 `example/SwiftUIListPanelUsage.ets`。该示例演示了列表容器、分隔线和多行内容，适合设置页或信息分组。

## 颜色与风格预设

`SwiftUITone` 继续保持三个基础颜色枚举：`GlassBlack`、`PureWhite`、`SystemGray`。如果业务希望更快套用品牌风格，可以从 `theme` 引入 `SwiftUIBrandStyle` 与 `swiftUIConfigForStyle()`，当前提供 `Graphite`、`Mist`、`Ocean`、`Mint`、`Amber`、`Rose`、`Lavender` 七组预设。预设只是快捷入口，仍可继续叠加 `withFillColor()`、`withTintColor()`、`withColor()`、`withAccentColor()`、`withBorder()`、`withShadow()`、`withRadius()`、`withPadding()`、`withSize()`、`withTitleFontSize()`、`withSubtitleFontSize()`、`withTextFontSize()`、`withIconSize()`、`withSpacing()` 等链式方法做高度自定义。

```ts
import { SwiftUIBrandStyle, swiftUIConfigForStyle } from '@kaworunagisa_hhl/theme'

const oceanStyle = swiftUIConfigForStyle(SwiftUIBrandStyle.Ocean)
  .withRadius(8)
  .withPadding(14)
  .withBorder('#6657C7F7', 1.2)
  .withShadow('#241D4ED8', 20)
```

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `config` | `SwiftUIComponentConfig` | 空配置 | SwiftUI modifier 风格链式配置，可覆盖宽高、圆角、颜色、边框、阴影、内边距等通用外观 |
| `spacing` | `number` | `0` | 列表内容间距 |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `componentWidth` | `Length` | `'100%'` | 容器宽度 |
| `componentHeight` | `Length` | `'auto'` | 容器高度 |
| `fillColor` | `ResourceColor` | `'#E6111111'` | 黑色毛玻璃底色 |
| `tintColor` | `ResourceColor` | 自动色调 | 渐变叠色 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 自定义边框色 |
| `customBorderWidth` | `number` | `1.2` | 边框宽度 |
| `cornerRadius` | `number` | `16` | 圆角 |
| `contentPadding` | `number` | `4` | 内容内边距 |
| `shadowColor` | `ResourceColor` | 自动阴影 | 阴影颜色 |
| `shadowRadius` | `number` | `20` | 阴影半径 |
| `contentBuilder` | `() => void` | 空内容 | 自定义列表内容 |
