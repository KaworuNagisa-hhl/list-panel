import { describe, it, expect } from '@ohos/hypium'
import { getSwiftUIGlassMaterial, SwiftUITone } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIListPanel', () => {
    it('uses_glass_container_contract', 0, () => {
      const material = getSwiftUIGlassMaterial(SwiftUITone.PureWhite)
      expect(material.fill.toString()).assertContain('#')
      expect(material.border.toString()).assertContain('#')
    })
  })
}
