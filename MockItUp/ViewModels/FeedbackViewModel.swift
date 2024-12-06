//
//  FeedbackViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 03/12/24.
//

import Foundation
import GoogleGenerativeAI

var GETTING_FEEDBACK = "Getting feedback"
var GETTING_REFERENCES = "Getting references"

@MainActor
class FeedbackViewModel: ObservableObject {
    
    @Published var feedback: String = GETTING_FEEDBACK
    @Published var references: String = GETTING_REFERENCES

    var generationConfig: GenerationConfig = GenerationConfig(responseMIMEType: "application/json")
    func getFeedbackFromLLM(transcript: String, question: String) async throws -> (references: String, feedback: String, success: Bool) {
        var success: Bool = false
        if(transcript != "") {
            feedback = GETTING_FEEDBACK
            references = GETTING_REFERENCES
//            if let secretKey = Bundle.main.object(forInfoDictionaryKey: "ApiSecret") as? String {
//                print("Secret Key: \(secretKey)")
//                let generativeModel =
//                  GenerativeModel(
//                    // Specify a Gemini model appropriate for your use case
//                    name: "gemini-1.5-flash",
//                    // Access your API key from your on-demand resource .plist file (see "Set up your API key"
//                    // above)
//                    apiKey: secretKey,
//                    generationConfig: generationConfig
//                  )
//                let prompt = "From the given question " + question + " and the transcript " + transcript + " please give the feedback on this based on question that is asked for that interview also provide references for practice. Give your response in small paragraph with may be 200 words at max" + "Give the response as schema: {\"feedback:\": str, \"reference:\": str }"
//                let response = try await generativeModel.generateContent(prompt)
//                if let text = response.text {
//                    print("Original Text: \(text)")
//
//                    // Convert text to Data
//                    if let jsonData = text.data(using: .utf8) {
//                        do {
//                            // Convert Data to JSON Object (Dictionary or Array)
//                            if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
//                                print("JSON Object: \(jsonObject)")
//                                print(jsonObject.keys)
//                                print(jsonObject.values)
//                                references = jsonObject["reference"] as? String ?? "Couldn't find any references"
//                                feedback = jsonObject["feedback"] as? String ?? "Couldn't find any feedback"
//                            } else {
//                                print("Failed to convert text to JSON Dictionary.")
//                            }
//                        } catch {
//                            print("Error converting text to JSON: \(error.localizedDescription)")
//                        }
//                    } else {
//                        print("Failed to convert text to Data.")
//                    }
//                }
//            }
            try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
                feedback = "This is a strong response that directly addresses the prompt's two parts.  The answer clearly highlights several key current trends in web development (micro frontends, WebAssembly, AI-driven interfaces, serverless architectures), showcasing a good understanding of the field. Mentioning specific examples adds weight to the response. The second part about keeping skills up-to-date is equally impressive, detailing concrete actions like following blogs, contributing to open-source, participating in communities, personal projects, and using educational platforms. This demonstrates a proactive and continuous learning approach.  To make it even better, you could briefly elaborate on *why* these trends are interesting to you, connecting them to your career aspirations or personal interests. For example, instead of just stating 'AI-driven interfaces,' you could mention a specific application of AI that excites you within that context (e.g., personalized recommendations, AI-powered chatbots).\nThis is a strong response that directly addresses the prompt's two parts.  The answer clearly highlights several key current trends in web development (micro frontends, WebAssembly, AI-driven interfaces, serverless architectures), showcasing a good understanding of the field. Mentioning specific examples adds weight to the response. The second part about keeping skills up-to-date is equally impressive, detailing concrete actions like following blogs, contributing to open-source, participating in communities, personal projects, and using educational platforms. This demonstrates a proactive and continuous learning approach.  To make it even better, you could briefly elaborate on *why* these trends are interesting to you, connecting them to your career aspirations or personal interests. For example, instead of just stating 'AI-driven interfaces,' you could mention a specific application of AI that excites you within that context (e.g., personalized recommendations, AI-powered chatbots).\nThis is a strong response that directly addresses the prompt's two parts.  The answer clearly highlights several key current trends in web development (micro frontends, WebAssembly, AI-driven interfaces, serverless architectures), showcasing a good understanding of the field. Mentioning specific examples adds weight to the response. The second part about keeping skills up-to-date is equally impressive, detailing concrete actions like following blogs, contributing to open-source, participating in communities, personal projects, and using educational platforms. This demonstrates a proactive and continuous learning approach.  To make it even better, you could briefly elaborate on *why* these trends are interesting to you, connecting them to your career aspirations or personal interests. For example, instead of just stating 'AI-driven interfaces,' you could mention a specific application of AI that excites you within that context (e.g., personalized recommendations, AI-powered chatbots)."
                references = "To practice this type of answer, try researching current web development trends from reputable sources like: \n * **Blogs:**  LogRocket Blog, CSS-Tricks, Smashing Magazine, A List Apart \n * **Newsletters:** Web Dev Digest, JavaScript Weekly \n * **Industry Reports:**  State of JavaScript survey, Stack Overflow Developer Survey \n \n Practice answering the question using different combinations of the trends mentioned above and adding your personal touch to explain your interest.  Focus on conveying your passion and continuous learning attitude. You can also practice with mock interviews using platforms like Pramp or interviewing.io.\n\n\nTo practice this type of answer, try researching current web development trends from reputable sources like: \n * **Blogs:**  LogRocket Blog, CSS-Tricks, Smashing Magazine, A List Apart \n * **Newsletters:** Web Dev Digest, JavaScript Weekly \n * **Industry Reports:**  State of JavaScript survey, Stack Overflow Developer Survey \n \n Practice answering the question using different combinations of the trends mentioned above and adding your personal touch to explain your interest.  Focus on conveying your passion and continuous learning attitude. You can also practice with mock interviews using platforms like Pramp or interviewing.io."
            success = true
        }
        else {
//            Task { @MainActor in
                feedback = "No transcript found try again"
//            }
//            Task { @MainActor in
                references = "No transcript found try again"
//            }
            print("Else", feedback, references)
        }

        return (references, feedback, success)
    }
    
}
