import EssentialFeed
import Foundation

// MARK: - Used for policy

extension Date {
    private var feedCacheMaxAgeInDays: Int {
        return 7
    }
    
    func minusFeedCacheMaxAge() -> Self {
        return self.adding(days: -feedCacheMaxAgeInDays)
    }
}
