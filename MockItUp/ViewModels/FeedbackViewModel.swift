//
//  FeedbackViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 03/12/24.
//

import Foundation
import GoogleGenerativeAI


@MainActor
class FeedbackViewModel: ObservableObject {
    
    @Published var feedback: String = "Feedback: "
    @Published var references: String = "References: "
    
    func getFeedbackFromLLM(transcript: String, question: String) async throws {
        
        if(transcript != "") {
            if let secretKey = Bundle.main.object(forInfoDictionaryKey: "ApiSecret") as? String {
                print("Secret Key: \(secretKey)")
            }
//            let generativeModel =
//              GenerativeModel(
//                // Specify a Gemini model appropriate for your use case
//                name: "gemini-1.5-flash",
//                // Access your API key from your on-demand resource .plist file (see "Set up your API key"
//                // above)
//                apiKey: "AIzaSyBRvxF-gmGvFcCpEqGm1xaaC8x3DAJtSBU"
//              )
//            let prompt = "From the given question " + question + " and the transcript " + transcript + " please give the feedback on this based on question that is asked for that interview also provide references for practice." + "Give the response as json with 2 keys: feedback and references."
//            let response = try await generativeModel.generateContent(prompt)
//            let response = "```json
//            {
//              "feedback": "This is a strong response to the interview question. It demonstrates a good understanding of current web development trends and a proactive approach to continuous learning.  Here are some minor suggestions for improvement:\n\n* **Specificity:** While the trends mentioned are relevant, adding a bit more detail to each would make the answer even stronger. For example, instead of just saying \"micro frontends for scalable architecture,\" you could mention a specific benefit or challenge related to micro frontends (e.g., \"the ability to independently deploy and update individual components of a large application, which reduces risk and improves development velocity\").  Similarly, for WebAssembly, you could mention a specific application where you've seen it used effectively or a particular advantage it offers over traditional JavaScript.\n\n* **Connection to Personal Experience:**  Briefly mentioning a personal project or experience related to one of the trends would add further weight to your answer and showcase practical application of your knowledge.  For example, \"I recently experimented with WebAssembly in a personal project to improve the performance of a computationally intensive task, and I was impressed by the results.\" \n\n* **Future Outlook:**  Adding a brief statement about your interest in exploring future trends or specific areas for continued learning would demonstrate a growth mindset and forward-thinking approach. For example, \"I'm also keeping a close eye on the development of WebXR and its potential for immersive user experiences.\"\n\nOverall, the answer is well-structured and highlights your commitment to professional development.  The inclusion of specific learning platforms (Udemy, LinkedIn Learning, Kaggle) adds credibility and shows your initiative.",
//              "references": {
//                "Micro Frontends": [
//                  "https://martinfowler.com/articles/micro-frontends.html",
//                  "https://www.smashingmagazine.com/2021/07/micro-frontends-architecture/"
//                ],
//                "WebAssembly": [
//                  "https://webassembly.org/",
//                  "https://developer.mozilla.org/en-US/docs/WebAssembly"
//                ],
//                "AI-Driven Interfaces": [
//                  "https://www.nngroup.com/articles/ai-ux-design/",
//                  "https://uxdesign.cc/designing-with-ai-a-guide-for-ux-designers-d55f063f1e66"
//                ],
//                "Serverless Architectures": [
//                  "https://aws.amazon.com/serverless/",
//                  "https://cloud.google.com/serverless"
//                ],
//                "Learning Platforms": [
//                  "https://www.udemy.com/",
//                  "https://www.linkedin.com/learning/",
//                  "https://www.kaggle.com/"
//                ],
//                "Open Source Projects": [
//                  "https://github.com/",
//                  "https://gitlab.com/"
//                ]
//              }
//            }
//            ```"
//            if let text = response.text {
//              print("Response" + text)
//            }
                feedback = feedback + "Test"
                references = references + "Test"
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

    }
    
}
