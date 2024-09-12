//
//  MemoCollectionViewController.swift
//  MemoPad
//
//  Created by 坂下雄哉 on 2024/09/10.
//

import UIKit

class MemoCollectionViewController: UIViewController,UICollectionViewDataSource {

    // MARK: セルの個数を決めるメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

    // MARK: セルに表示する内容を設定するメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Storyboard上で用意されたセルを読み込む
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        // セルの中身（コンテンツ）を設定できる変数を用意する
        var contentConfiguration = UIListContentConfiguration.cell()
        // タイトルを設定する
        contentConfiguration.text = titles[indexPath.item]
        
        contentConfiguration.secondaryText = contents[indexPath.item]
        // サブタイトルを設定する
        //contentConfiguration.secondaryText = "コレクションビューを勉強している"
        // セルの設定を更新する
        cell.contentConfiguration = contentConfiguration
        // セルの設定を完了する
        return cell
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData.register(defaults: ["titles":[],"contents":[]])
        titles = saveData.object(forKey: "titles") as! [String]
        contents = saveData.object(forKey: "contents") as! [String]
        
        collectionView.dataSource = self
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
        
    

      
    }
 

}
