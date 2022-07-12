import SwiftUI
import UIKit

@available(iOS 13.0, *)
public struct RichTextEditor: View {
    @State var dynamicHeight: CGFloat = 100
    
    @Binding var richText: NSMutableAttributedString
    private let placeholder: String
    private let accessorySections: Array<EditorSection>
    var defaultFontSize = UIFont.systemFontSize
    var defaultFontName = "AvenirNext-Regular"
    var defaultFontColor = UIColor.white
    
    public init(
        richText: Binding<NSMutableAttributedString>,
        placeholder: String = "Type ...",
        accessory sections: Array<EditorSection> = EditorSection.allCases,
        defaultFontName: String = "AvenirNext-Regular",
        defaultFontSize: CGFloat = UIFont.systemFontSize,
        defaultFontColor: UIColor = UIColor.white
    ) {
        self._richText = richText
        self.placeholder = placeholder
        self.accessorySections = sections
        self.defaultFontName = defaultFontName
        self.defaultFontSize = defaultFontSize
        self.defaultFontColor = defaultFontColor
    }
    
    public var body: some View {
        TextEditorWrapper(richText: $richText, height: $dynamicHeight, placeholder: placeholder, sections: accessorySections, defaultFontName: defaultFontName, defaultFontSize: defaultFontSize, defaultFontColor: defaultFontColor)
            .frame(minHeight: dynamicHeight, maxHeight: dynamicHeight)
    }
}

@available(iOS 13.0, *)
struct RichTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        @State var richText: NSMutableAttributedString = NSMutableAttributedString()
        
        var body: some View {
            ZStack {
                Color(hex: "EED6C4")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    RichTextEditor(richText: $richText)
                        .padding()
                        .background(
                            Rectangle().stroke(lineWidth: 1)
                        )
                        .padding()
                }
            }
        }
    }
}
