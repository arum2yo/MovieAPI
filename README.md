### **주요기능** 
----------------
- 네트워크 환경에서 자료 받아오기
- TableViewController를 이용한 화면 구성
- TableViewCell에서 Horizontal-CollectionView구성 


### **완성 화면**
-----------------
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/67727048/91659428-59fa5600-eb0a-11ea-9d74-894e6181862f.gif)


### **활용한 기술** 
------------------
- Swift, Moya, Decodable
- Kingfisher, Horizontal-CollectionView in TableViewCell
- ProgressHUD

[사용한 API사이트: The MovieDB](https://www.themoviedb.org/?language=ko)


### **스터디 노트**
------------------
**1.Moya를 이용한 API표준 모듈화 작업**
<img width="574" alt="스크린샷 2020-08-30 오후 9 55 07" src="https://user-images.githubusercontent.com/67727048/91659582-94b0be00-eb0b-11ea-9de4-59cdf1554cea.png"><img width="822" alt="스크린샷 2020-08-30 오후 9 55 22" src="https://user-images.githubusercontent.com/67727048/91659573-8498de80-eb0b-11ea-9845-2fffd3c3fb2e.png">

**2.MoyaProvider를 이용하여 네트워킹. (Decoding방식으로 데이터 전환)**

   ```
 static func getNowplayingNetwork(page: Int, completion: @escaping ([Movie]) -> ()){
        
        ProgressHUD.show()
        provider.request(.getNowPlaying(page: page)) { (result) in
            switch result{
            case .success(let response):
                do{
                   let results = try! decoder.decode(APIResult.self, from: response.data)
                    completion(results.results)
                } catch {
                    print(error)
                    ProgressHUD.dismiss()
                    break
                }
            case .failure(let error):
                print(error)
                ProgressHUD.dismiss()
                break
            }
        }
    }
```
**3. TableViewCell에 가로스크롤(Horizontal CollectionViewCell) 넣기**

```
class MovieCollecttionTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!{
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
        public var upcomingMovie = [Movie](){
            didSet{
                self.collectionView.reloadData()
            }
        }
```
TableviewCell에 UICollectionViewDataSource, UICollectionViewDelegate을 Extension하여 사용.
