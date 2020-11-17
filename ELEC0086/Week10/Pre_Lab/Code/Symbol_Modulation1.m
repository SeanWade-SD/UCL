function [output1, output2] = Symbol_Modulation1(N, mType)
%
% [output1, output2] = Symbol_Modulation1(N, mType)
%
% N is the number of samples
% mType indicates what type of modulation
% case 2: BPSK
% case 4: QPSK
% case 16: 16QAM
% case 64: 64QAM
% output1 gives the modulated signal with normalized energy
% output2 gives symbols with normalized energy



switch mType
    
    case 2
        
%         generate a random sequence of N BPSK symbols {±1}
        c = [-1 1];
        s = ones(1,N);
        k = randi(mType,1,N);
        s(k == 2) = -1;
%         
%         for n = 1:N
%             k = randi(mType);
%             s(n) = c(k);
%         end
          
    case 4
        
%         generate a random sequence of N QPSK symbols {±1±j}
        
        c = [-1-1i -1+1i 1-1i 1+1i];
        Pav = mean(abs(c).^2);
        c = c/sqrt(Pav);
        s = ones(1,N);
        k = randi(mType,1,N);
        
        for n = 1:mType
            s(k==n) = c(n);
        end
%         
%         s(k==1) = c(1);
%         s(k==2) = c(2);
%         s(k==3) = c(3);
%         s(k==4) = c(4);
%         
        
%         for n = 1:N
%             k = randi(mType);
%             s(n) = c(k);
%         end
        
    case 16
        
%         generate a random sequence of N 16-QAM symbols {(±1 or ±3) + (±j or ±3j)}
        
        
        sI = [-3 -1 1 3];
        sQ = [-3 -1 1 3];
        l = 1;
        c = ones(1,mType);
        for m1 = 1:4
            for m2 = 1:4
                c(l) = sI(m1) + 1i*sQ(m2);
                l = l + 1;
            end
        end
        Pav = mean(abs(c).^2);
        c = c/sqrt(Pav);
        s = ones(1,N);
        k = randi(mType,1,N);
        
        for n = 1:mType
            s(k==n) = c(n);
        end
        
%         for n = 1:N
%             k = randi(mType);
%             s(n) = c(k);
%         end     
        
    case 64
        
%         generate a random sequence of N 64-QAM symbols
        
        
        sI = [-7 -5 -3 -1 1 3 5 7];
        sQ = [-7 -5 -3 -1 1 3 5 7];
        l = 1;
        c = ones(1,mType);
        for m1 = 1:8
            for m2 = 1:8
                c(l) = sI(m1) + 1i*sQ(m2);
                l = l + 1;
            end
        end
        Pav = mean(abs(c).^2);
        c = c/sqrt(Pav);
        s = ones(1,N);
        k = randi(mType,1,N);
        
        for n = 1:mType
            s(k==n) = c(n);
        end
        
%         for n = 1:N
%             k = randi(mType);
%             s(n) = c(k);
%         end     

end


output1 = s;
output2 = c;








