function L = generate_L(kernel, img_size)

    L = kernel(ceil(size(kernel,2)/2))*eye(img_size);
    for i=1:(floor(size(kernel,2)/2))
      matrix1 = [zeros(img_size, i)  kernel(ceil(size(kernel,2)/2)-i)*eye((img_size))];
      matrix1 = matrix1(:, 1:(end-i));
      L = L+matrix1;
    end
    for i=1:(floor(size(kernel,2)/2))
      matrix1 = [zeros(img_size, i)';  kernel(ceil(size(kernel,2)/2)-i)*eye((img_size))];
      matrix1 = matrix1(1:(end-i),:);
      if i == 1
          matrix2 = zeros(size(L));
          matrix2(1, end) = kernel((floor(size(kernel,2)/2)));
          matrix2(end, 1) = kernel((floor(size(kernel,2)/2)));
          L = L + matrix2;
      end
      if i == 2
          matrix2 = zeros(size(L));
          matrix2(1, end-1) = kernel((floor(size(kernel,2)/2))-1);
          matrix2(2, end)   = kernel((floor(size(kernel,2)/2))-1);
          matrix2(end-1, 1) = kernel((floor(size(kernel,2)/2))-1);
          matrix2(end, 2)   = kernel((floor(size(kernel,2)/2))-1);
          L = L + matrix2;
      end
      L = L+matrix1;
    end
end

