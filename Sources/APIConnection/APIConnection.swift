import OpenAIKit
import AsyncHTTPClient
import Foundation

enum VoiceType: String {
    case undefined
    case waveNetFemale = "en-US-Wavenet-F"
    case waveNetMale = "en-US-Wavenet-D"
    case standardFemale = "en-US-Standard-E"
    case standardMale = "en-US-Standard-D"
}

public class APIConnection: ObservableObject {
    
    let ttsAPIUrl = "https://texttospeech.googleapis.com/v1beta1/text:synthesize"
    let googleAPIKey = "AIzaSyAhn9kCXeF9bcr_jObxK9sfE3ZVFrnL4ds"
    private static var openApiKey = "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"
    private static var organization = ""
    private var openAIClient: Client
    private var httpClient: HTTPClient
    
    private var views: Views = .OrderCoffee
    private var history: [(String, String)] = []


    public init() {
        httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
        let configuration = Configuration(apiKey: APIConnection.openApiKey, organization: APIConnection.organization)
        openAIClient = OpenAIKit.Client(httpClient: httpClient, configuration: configuration)
    }

    deinit {
        try! httpClient.syncShutdown()
    }
    
    public func change(view: Views) {
        self.views = view
    }
    
    public func reset() {
        self.history = []
    }

    public func getResponse(prompt: String) async throws -> String {
        let send = promptFor(view: views, history: history + [(prompt, "")])
        print(send)
        let completion = try await openAIClient.completions.create(
            model: Model.GPT3.textDavinci003,
            prompts: [send],
            maxTokens: 68,
            temperature: 0.7,
            topP: 1,
            echo: false,
            presencePenalty: 0,
            frequencyPenalty: 0,
            bestOf: 1
        )

        history.append((prompt, completion.choices[0].text.trimmingCharacters(in: .whitespacesAndNewlines)))
        return completion.choices[0].text.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
