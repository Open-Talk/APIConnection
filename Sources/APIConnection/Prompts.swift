//
//  Prompts.swift
//  
//
//  Created by Omar Elamri on 2/18/23.
//


public enum Views: String {
    case Interview
    case OrderCoffee
}

func promptFor(view: Views, history: [(String, String)]) -> String {
    switch view {
    case .Interview:
        return """
I will give you a transcript of a job interview. Specifically, of a prospective software engineer. The following lines will start with either 'Interviewer' or 'Interviewee'.

"""
        + history.map { "\nInterviewee: " + $0.0 + "\nInterviewer: " + $0.1 }.joined(separator: "") +
"""
\nReply with only the Interviewer's response, which should be 50 words. Do not add any quotation marks to your response.
"""
    case .OrderCoffee:
        return ""
    }
}
