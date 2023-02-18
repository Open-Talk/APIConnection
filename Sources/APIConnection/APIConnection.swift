import OpenAIKit
import AsyncHTTPClient
import Foundation

public class APIConnection {

    enum VoiceType: String {
        case undefined
        case waveNetFemale = "en-US-Wavenet-F"
        case waveNetMale = "en-US-Wavenet-D"
        case standardFemale = "en-US-Standard-E"
        case standardMale = "en-US-Standard-D"
    }
    enum GoogleAPIError: Error {
        case die
    }

    public private(set) var text = "Hello, World!"
    
    private static var openApiKey = "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"
    private static var organization = ""
    private var openAIClient: Client
    private var httpClient: HTTPClient
    private var history: [(String, String)] = []

    let ttsAPIUrl = "https://texttospeech.googleapis.com/v1beta1/text:synthesize"
    let googleAPIKey = "AIzaSyAhn9kCXeF9bcr_jObxK9sfE3ZVFrnL4ds"


    public init() {
        httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
        let configuration = Configuration(apiKey: APIConnection.openApiKey, organization: APIConnection.organization)
        openAIClient = OpenAIKit.Client(httpClient: httpClient, configuration: configuration)
    }

    deinit {
        try! httpClient.syncShutdown()
    }

    func getResponse(prompt: String) async throws -> String {
        let completion = try await openAIClient.completions.create(
            model: Model.GPT3.textDavinci003,
            prompts: [prompt],
            maxTokens: 68,
            temperature: 0.7,
            topP: 1,
            echo: false,
            presencePenalty: 0,
            frequencyPenalty: 0,
            bestOf: 1
        )

        history.append((prompt, completion.choices[0].text))
        return String(completion.choices.map {$0.text + "\n" + $0.finishReason}.joined(separator: "\n"))
    }
}
