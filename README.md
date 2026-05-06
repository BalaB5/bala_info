https://stitch.withgoogle.com/projects/12781989359317400512


https://chatgpt.com/share/69bb6b1a-2518-800b-ad39-d06be734d8fd

# 1. Ensure the model is in inference mode again
FastLanguageModel.for_inference(model)

# 2. Use the exact same prompt as before
inputs = tokenizer.apply_chat_template(
    messages, # Using the same 'messages' variable from above
    add_generation_prompt = True,
    return_tensors = "pt",
).to("cuda")

# 3. Generate the new response
print("--- AFTER FINETUNING ---")
outputs = model.generate(input_ids = inputs, max_new_tokens = 128)
print(tokenizer.batch_decode(outputs, skip_special_tokens=True)[0])

https://colab.research.google.com/drive/1eF_iterV1xmBVjteXO9mPcDVpC9elR-r?usp=sharing