import Foundation

public struct Post {
    public let author: String           // Никнейм автора публикации
    public let description: String      // Текст публикации
    public let image: String            // Имя картинки
    public let likes: Int               // Количество лайков
    public let views: Int               // Количество просмотров

    public init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
}
