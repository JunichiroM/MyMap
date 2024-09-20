//
//  ContentView.swift
//  MyMap
//
//  Created by apple on 2024/09/19.
//

import SwiftUI

struct ContentView: View {
    
    //入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    @State var displaySearchKey: String = ""
    @State var displayMapType: MapType = .standard
    
    var body: some View {
        VStack {
            //テキストフィールド（文字入力）
            TextField("キーワード",text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    //入力が完了したので検索キーワードに設定する
                    displaySearchKey = inputText
                }
                .padding()
            
            //奥から手前方向にレイアウト（右下基準で配置する）
            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: displaySearchKey)
            }
        }
    }
}

#Preview {
    ContentView()
}
