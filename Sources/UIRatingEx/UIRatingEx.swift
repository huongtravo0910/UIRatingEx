import SwiftUI

@available(OSX 11, *)
public struct UIRatingEx: View {
    var maxRating: Int
    @Binding var currentRating: Int
    var width:Int
    var color: Color
    var ratingImage: RatingImage
  
    public init(maxRating: Int, currentRating: Binding<Int>, width: Int = 20, color: Color = Color.yellow, ratingImage: RatingImage = .star) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.color = color
        self.ratingImage = ratingImage
    }
    
    public var body: some View {
        HStack {
            ForEach(0..<maxRating) { rating in
                correctImage(for: rating)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.red)
                    .onTapGesture {
                        self.currentRating = rating+1
                    }
            }
        }.frame(width: CGFloat(maxRating * width))
    }
    
    func correctImage(for rating: Int) -> Image {
        if rating < currentRating {
            return ratingImage.fillImage
        } else {
            return ratingImage.openImage
        }
    }
}

struct UIRatingEx_Previews: PreviewProvider {
    
    @available(OSX 10.15.0, *)
    static var previews: some View {
        
        if #available(OSX 11, *) {
            UIRatingEx(maxRating: 5, currentRating: .constant(3))
        } else {
            // Fallback on earlier versions
        }
        
    }
}

