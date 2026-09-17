import { SwiftUIListPanel } from 'list-panel'

@Component
export struct SwiftUIListPanelUsage {
  build() {
    SwiftUIListPanel({
      contentBuilder: () => {
        Text('Blood pressure')
          .fontSize(15)
          .fontColor('#F8F8F8')
        Divider()
        Text('Heart rate')
          .fontSize(15)
          .fontColor('#F8F8F8')
      }
    })
  }
}
