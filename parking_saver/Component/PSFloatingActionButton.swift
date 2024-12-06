//
//  PSFloatingActionButton.swift
//  parking_saver
//
//  Created by 林 明虎 on 2024/11/19.
//

import SwiftUI

struct PSFloatingActionButton: View {
    var action: () -> Void // ボタンが押されたときの動作を受け取るクロージャ
    var icon: String       // ボタンに表示するアイコン名 (SF Symbols)
    var backgroundColor: Color = .blue // 背景色 (デフォルトは青)
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .foregroundColor(.orange)
                .font(.system(size: 24))
                .frame(width: 56, height: 56)
                .background(backgroundColor)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
        }
        .padding(16)
    }
}

struct FloatingActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PSFloatingActionButton(
            action: {
                print("Button tapped!")
            },
            icon: "mappin.and.ellipse", // SF Symbolsのアイコン名
            backgroundColor: .white // 背景色をカスタマイズ
        )
    }
}
