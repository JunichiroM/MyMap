//
//  MapView.swift
//  MyMap
//
//  Created by apple on 2024/09/19.
//

import SwiftUI
import MapKit

struct MapView: /*View*/UIViewRepresentable {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
    let searchKey: String
    
    //表示するViewを作成する時に実行
    func makeUIView(context: Context) -> MKMapView {
        //MKMapViewのインスタンス生成
        MKMapView()
    }
    
    //表示したViewが更新されるたびに実行
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print("検索キーワード：\(searchKey)")
        
        //CLGeocoderインスタンスを作成
        let geocoder = CLGeocoder()
        
        //入力された文字から位置情報を取得
        geocoder.geocodeAddressString(
            searchKey, completionHandler: { (placemarks, error) in
                //リクエストの結果が存在し、1件目の情報から位置情報を取り出す
                if let placemarks,
                   let firstPlacemark = placemarks.first,
                   let location = firstPlacemark.location {
                    
                    //位置情報から緯度経度をtargetCordinateに取り出す
                    let targetCordinate = location.coordinate
                    
                    //緯度経度をデバッグエリアに表示
                    print("緯度経度：\(targetCordinate)")
                    
                    //MKPointAnnotationインスタンスを生成し、ピンを作る
                    let pin = MKPointAnnotation()
                    
                    //ピンを置く場所に緯度経度を設定
                    pin.coordinate = targetCordinate
                    
                    pin.title = searchKey
                    
                    //ピンを地図に置く
                    uiView.addAnnotation(pin)
                    
                    //緯度経度を中心に半径500mの範囲を指示
                    uiView.region = MKCoordinateRegion(
                        center: targetCordinate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0)
                    
                }//end of 'if'
            })
    }
}

#Preview {
    MapView(searchKey: "羽田空港")
}
