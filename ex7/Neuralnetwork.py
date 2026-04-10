import numpy as np

def step_function(yin, threshold):
    return 1 if yin > threshold else 0

def run_classifier():
    print("--- Perceptron Classifier (Step Function) ---")
    print("1) AND Gate\n2) OR Gate\n3) Manual Input (Generic)")
    choice = input("Select an option (1/2/3): ")

    if choice == '1':
        X = np.array([[0,0], [0,1], [1,0], [1,1]])
        y_target = np.array([0, 0, 0, 1])
        num_features = 2
    elif choice == '2':
        X = np.array([[0,0], [0,1], [1,0], [1,1]])
        y_target = np.array([0, 1, 1, 1])
        num_features = 2
    elif choice == '3':
        num_samples = int(input("Enter number of data points: "))
        num_features = int(input("Enter number of features: "))
        X, y_target = [], []
        print(f"Enter {num_features} features + 1 target for each sample:")
        for i in range(num_samples):
            data = list(map(float, input(f"Sample {i+1}: ").split()))
            X.append(data[:num_features])
            y_target.append(data[num_features])
        X, y_target = np.array(X), np.array(y_target)
    else: return


    weights = np.array([float(input(f"Initial weight w{i+1}: ")) for i in range(num_features)])
    bias = float(input("Enter initial bias (b): "))
    lr = float(input("Enter learning rate: "))
    threshold = float(input("Enter activation threshold: "))
    epochs = int(input("Enter max number of epochs: "))

    feat_cols = " ".join([f"x{i+1}" for i in range(num_features)])
    weight_cols = " ".join([f"w{i+1}" for i in range(num_features)])

    for epoch in range(1, epochs + 1):
        print(f"\n" + "="*20 + f" EPOCH {epoch} " + "="*20)
        print(f"{feat_cols:<10} | {'yin':<6} | {'y':<3} | {'Target':<6} | {weight_cols:<10} | {'b':<5}")
        print("-" * 65)

        converged = True
        for i in range(len(X)):
            yin = np.dot(X[i], weights) + bias
            y_pred = step_function(yin, threshold)

            error = y_target[i] - y_pred
            if error != 0:
                weights = weights + (lr * error * X[i])
                bias = bias + (lr * error)
                converged = False

            # Print row for this specific data point
            feat_str = " ".join([f"{val:g}" for val in X[i]])
            weight_str = " ".join([f"{w:.2f}" for w in weights])
            print(f"{feat_str:<10} | {yin:<6.2f} | {y_pred:<3} | {y_target[i]:<6g} | {weight_str:<10} | {bias:<5.2f}")

        if converged:
            print(f"\nSuccess: Model converged at Epoch {epoch}!")
            break

    print("\n--- Training Finalized ---")
    print(f"Final Weights: {weights}")
    print(f"Final Bias: {bias}")

if __name__ == "__main__":
    run_classifier()
