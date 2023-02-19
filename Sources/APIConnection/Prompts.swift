//
//  Prompts.swift
//  
//
//  Created by Omar Elamri on 2/18/23.
//


public enum Views: String {
    case Interview
    case OrderCoffee
    case Conversation
    case Skins
    case Voices
}

func promptFor(view: Views, history: [(String, String)]) -> String {
    switch view {
    case .Interview:
        return """
I will give you a transcript of a job interview. Specifically, ask behavioral questions about the user and their past experience. The following lines will start with either 'Interviewer' or 'Interviewee'.

"""
        + history.map { "\nInterviewee: " + $0.0 + "\nInterviewer: " + $0.1 }.joined(separator: "") +
"""
\nReply with only the Interviewer's response, which should be 35 words or fewer. If you must, your response can be longer. Do not add any quotation marks to your response.
"""
    case .OrderCoffee:
        return """
I will give you a transcript of a customer ordering coffee from you, the barista. The following lines will start with either 'Barista' or 'Customer'.

"""
        + history.map { "\nCustomer: " + $0.0 + "\nBarista: " + $0.1 }.joined(separator: "") +
"""
\nReply with only the Barista's response, which should be 35 words or fewer. If you must, your response can be longer. Do not add any quotation marks to your response.
"""
    case .Conversation:
        return """
I will give you a transcript of a casual conversation between friends, me and you. The following lines will start with either 'human' or 'AI'.

"""
        + history.map { "\nhuman: " + $0.0 + "\nAI: " + $0.1 }.joined(separator: "") +
"""
\nReply with only the AI's response, which should be 35 words or fewer. If you must, your response can be longer. Do not add any quotation marks to your response.
"""
    default: //For non-chat screens
        return ""
    }
}
