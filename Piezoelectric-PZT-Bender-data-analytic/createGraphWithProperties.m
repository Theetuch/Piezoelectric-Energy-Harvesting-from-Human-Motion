function createGraphWithProperties(x, y, varargin)
    % Create a graph with specified properties
    
    % Default values
    titleText = ''; 
    xLabelTxt = ''; 
    yLabelTxt = '';
    xlimVals = []; % Default value for x-axis limits
    ylimVals = []; % Default value for y-axis limits
    legendTxt = {}; % Default value for legend text
    
    % Parse optional arguments
    idx = 1;
    while idx <= numel(varargin)
        if strcmpi(varargin{idx}, 'title')
            titleText = varargin{idx + 1};
            idx = idx + 2;
        elseif strcmpi(varargin{idx}, 'xlabel')
            xLabelTxt = varargin{idx + 1};
            idx = idx + 2;
        elseif strcmpi(varargin{idx}, 'ylabel')
            yLabelTxt = varargin{idx + 1};
            idx = idx + 2;
        elseif strcmpi(varargin{idx}, 'xlim')
            xlimVals = varargin{idx + 1};
            idx = idx + 2;
        elseif strcmpi(varargin{idx}, 'ylim')
            ylimVals = varargin{idx + 1};
            idx = idx + 2;
        else
            % If it's not one of the recognized arguments, break the loop
            break;
        end
    end
    
    % Now parse remaining arguments which should be 'legend'
    while idx <= numel(varargin)
        if strcmpi(varargin{idx}, 'legend')
            legendTxt = varargin{idx + 1};
            idx = idx + 2;
        else
            error('Unknown argument: %s', varargin{idx});
        end
    end
    
    % Plotting the graph
    plot(x, y);
    
    % Setting the title
    title(titleText);
    
    % Setting x-axis label
    xlabel(xLabelTxt);
    
    % Setting y-axis label
    ylabel(yLabelTxt);
    
    % Display grid
    grid on;
    
    % Setting xlim if provided
    if ~isempty(xlimVals)
        xlim(xlimVals);
    end
    
    % Setting ylim if provided
    if ~isempty(ylimVals)
        ylim(ylimVals);
    end
    
    % Adding legend if provided
    if ~isempty(legendTxt)
        legend(legendTxt);
    end
end
