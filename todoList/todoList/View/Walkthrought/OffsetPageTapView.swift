import SwiftUI

struct OffsetPageTabView<Content: View>: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return OffsetPageTabView.Coordinator(parent: self)
    }

    var content: Content
    @Binding var offset: CGFloat

    init(offset:Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self._offset = offset
    }


    func makeUIView(context: Context) -> UIScrollView {

        let scrollview = UIScrollView()

        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostview.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
            hostview.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            hostview.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor)
        ]

        scrollview.addSubview(hostview.view)
        scrollview.addConstraints(constraints)

        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false

        scrollview.delegate = context.coordinator

        return scrollview
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        let currentOffset = uiView.contentOffset.x

        if currentOffset != offset {
        print("updating")
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }

    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: OffsetPageTabView
        init(parent: OffsetPageTabView) {
            self.parent = parent
        }
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x

            parent.offset = offset
        }

    }
}

struct OffsetPageTabView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in

                    let size = proxy.size
                    Walkthrough(screenSize: size)
                }
    }
}
