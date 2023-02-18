import OpenAIKit
import AsyncHTTPClient


public struct APIConnection {
    public private(set) var text = "Hello, World!"
    
    private static var apiKey = ""
    private static var organization = ""

    public init() {
        let httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
        let configuration = Configuration(apiKey: APIConnection.apiKey, organization: APIConnection.organization)

        let openAIClient = OpenAIKit.Client(httpClient: httpClient, configuration: configuration)
    }
}
