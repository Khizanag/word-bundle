//
//  SwipeModifier.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 27.07.22.
//

import SwiftUI

/// source: https://stackoverflow.com/questions/60885532/how-to-detect-swiping-up-down-left-and-right-with-swiftui-on-a-view

struct SwipeModifier: ViewModifier {
    enum Directions: Int {
        case up, down, left, right
    }

    enum Trigger {
        case onChanged, onEnded
    }

    var trigger: Trigger
    var handler: ((Directions) -> Void)?

    func body(content: Content) -> some View {
        content.gesture(
            DragGesture(
                minimumDistance: 24,
                coordinateSpace: .local
            )
            .onChanged {
                if trigger == .onChanged {
                    handle($0)
                }
            }
            .onEnded {
                if trigger == .onEnded {
                    handle($0)
                }
            }
        )
    }

    private func handle(_ value: _ChangedGesture<DragGesture>.Value) {
        let hDelta = value.translation.width
        let vDelta = value.translation.height

        if abs(hDelta) > abs(vDelta) {
            handler?(hDelta < 0 ? .left : .right)
        } else {
            handler?(vDelta < 0 ? .up : .down)
        }
    }
}

extension View {
    func onSwiped(
        trigger: SwipeModifier.Trigger = .onChanged,
        action: @escaping (SwipeModifier.Directions) -> Void
    ) -> some View {
        let swipeModifier = SwipeModifier(trigger: trigger) {
            action($0)
        }
        return self.modifier(swipeModifier)
    }
    func onSwiped(
        _ direction: SwipeModifier.Directions,
        trigger: SwipeModifier.Trigger = .onChanged,
        action: @escaping () -> Void
    ) -> some View {
        let swipeModifier = SwipeModifier(trigger: trigger) {
            if direction == $0 {
                action()
            }
        }
        return self.modifier(swipeModifier)
    }
}
