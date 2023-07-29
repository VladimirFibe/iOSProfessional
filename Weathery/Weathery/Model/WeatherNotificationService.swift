import Foundation

struct WeatherNotificationService {
    func fetchWeather(cityName: String) {
        let weatherModel = WeatherModel(conditionId: 200,
                                                cityName: cityName,
                                                temperature: 22)
        let data = ["currentWeather": weatherModel]
        NotificationCenter.default.post(name: .didReceiveWeather, object: self, userInfo: data)
    }
}
extension Notification.Name {
    static let didReceiveWeather = Notification.Name("didReceiveWeather")
}

