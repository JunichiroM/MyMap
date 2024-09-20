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
                //マップを表示
                MapView(searchKey: displaySearchKey, mapType: displayMapType)
                
                //マップ種類切り替えボタン
                Button{
                    //標準　→ 衛生写真　→ 衛生写真＋交通機関ラベル
                    if displayMapType == .standard {
                        displayMapType = .satellite
                    }else if displayMapType == .satellite {
                        displayMapType = .hybrid
                    }else {
                        displayMapType = .standard
                    }
                } label: {
                    //マップアイコンの表示
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                } //Buttonここまで
                //　右の余白20空ける
                .padding(.trailing, 20)
                // 下の余白を30空ける
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ContentView()
}
