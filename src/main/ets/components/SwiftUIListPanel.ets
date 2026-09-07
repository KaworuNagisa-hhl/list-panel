import {
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  SWIFT_UI_RADIUS_CARD,
  SWIFT_UI_SPACING_EXTRA_SMALL,
  SwiftUITone,
  swiftUIColorWithOpacity
} from 'theme'

@Builder
function EmptyBuilder() {
  Blank()
}

@Component
export struct SwiftUIListPanel {
  @Prop spacing: number = 0
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = '100%'
  @Prop componentHeight: Length = 'auto'
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop customBorderWidth: number = 1.2
  @Prop cornerRadius: number = SWIFT_UI_RADIUS_CARD
  @Prop contentPadding: number = SWIFT_UI_SPACING_EXTRA_SMALL
  @Prop shadowColor: ResourceColor = '#00000000'
  @Prop shadowRadius: number = 20
  @BuilderParam contentBuilder: () => void = EmptyBuilder

  private resolvedTintColor(): ResourceColor {
    return this.tintColor === '#00000000' ? swiftUIColorWithOpacity(getSwiftUIPalette(this.tone).surfaceMuted, 0.16) : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    return this.customBorderColor === '#00000000' ? getSwiftUIGlassMaterial(this.tone).border : this.customBorderColor
  }

  private resolvedShadowColor(): ResourceColor {
    return this.shadowColor === '#00000000' ? getSwiftUIGlassMaterial(this.tone).shadow : this.shadowColor
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Row()
        .width('100%')
        .height(1)
        .backgroundColor(getSwiftUIGlassMaterial(this.tone).highlight)
        .opacity(0.82)

      Column({ space: this.spacing }) {
        this.contentBuilder()
      }
      .width('100%')
      .padding(this.contentPadding)
    }
    .width(this.componentWidth)
    .height(this.componentHeight)
    .backgroundColor(this.fillColor)
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [
        [this.fillColor, 0.0],
        [this.fillColor, 0.66],
        [this.resolvedTintColor(), 1.0]
      ]
    })
    .backgroundBlurStyle(BlurStyle.Regular)
    .borderRadius(this.cornerRadius)
    .border({ width: this.customBorderWidth, color: this.resolvedBorderColor() })
    .shadow({ radius: this.shadowRadius, color: this.resolvedShadowColor(), offsetX: 0, offsetY: 9 })
  }
}
