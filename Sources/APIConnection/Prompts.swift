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

func promptFor(view: Views) -> String {
    switch view {
    case .Interview:
        return """
I will give you a transcript of a job interview. Specifically, of a prospective software engineer. The following lines will start with either 'Interviewer' or 'Interviewee'.
Interviewer:

Reply with only the Interviewer's response, which should be around 50 words.
"""
    case .OrderCoffee:
        return ""
    }
}
