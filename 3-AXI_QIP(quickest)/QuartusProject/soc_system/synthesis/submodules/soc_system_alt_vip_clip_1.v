// soc_system_alt_vip_clip_1.v

// This file was auto-generated from alt_vip_cl_clp_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module soc_system_alt_vip_clip_1 #(
		parameter BITS_PER_SYMBOL              = 8,
		parameter NUMBER_OF_COLOR_PLANES       = 2,
		parameter COLOR_PLANES_ARE_IN_PARALLEL = 1,
		parameter PIXELS_IN_PARALLEL           = 1,
		parameter MAX_IN_WIDTH                 = 720,
		parameter MAX_IN_HEIGHT                = 576,
		parameter CLIPPING_METHOD              = "RECTANGLE",
		parameter LEFT_OFFSET                  = 0,
		parameter RIGHT_OFFSET                 = 0,
		parameter TOP_OFFSET                   = 24,
		parameter BOTTOM_OFFSET                = 0,
		parameter RECTANGLE_WIDTH              = 720,
		parameter RECTANGLE_HEIGHT             = 480,
		parameter USER_PACKET_SUPPORT          = "PASSTHROUGH",
		parameter RUNTIME_CONTROL              = 0,
		parameter LIMITED_READBACK             = 0
	) (
		input  wire        main_clock,         // main_clock.clk
		input  wire        main_reset,         // main_reset.reset
		input  wire [15:0] din_data,           //        din.data
		input  wire        din_valid,          //           .valid
		input  wire        din_startofpacket,  //           .startofpacket
		input  wire        din_endofpacket,    //           .endofpacket
		output wire        din_ready,          //           .ready
		output wire [15:0] dout_data,          //       dout.data
		output wire        dout_valid,         //           .valid
		output wire        dout_startofpacket, //           .startofpacket
		output wire        dout_endofpacket,   //           .endofpacket
		input  wire        dout_ready          //           .ready
	);

	wire         scheduler_av_st_cmd_vib_valid;                // scheduler:av_st_cmd_vib_valid -> video_in_cmd:av_st_cmd_valid
	wire  [63:0] scheduler_av_st_cmd_vib_data;                 // scheduler:av_st_cmd_vib_data -> video_in_cmd:av_st_cmd_data
	wire         scheduler_av_st_cmd_vib_ready;                // video_in_cmd:av_st_cmd_ready -> scheduler:av_st_cmd_vib_ready
	wire         scheduler_av_st_cmd_vib_startofpacket;        // scheduler:av_st_cmd_vib_startofpacket -> video_in_cmd:av_st_cmd_startofpacket
	wire         scheduler_av_st_cmd_vib_endofpacket;          // scheduler:av_st_cmd_vib_endofpacket -> video_in_cmd:av_st_cmd_endofpacket
	wire         scheduler_av_st_cmd_alg_core_valid;           // scheduler:av_st_cmd_alg_core_valid -> clipper_core:av_st_cmd_valid
	wire  [63:0] scheduler_av_st_cmd_alg_core_data;            // scheduler:av_st_cmd_alg_core_data -> clipper_core:av_st_cmd_data
	wire         scheduler_av_st_cmd_alg_core_ready;           // clipper_core:av_st_cmd_ready -> scheduler:av_st_cmd_alg_core_ready
	wire         scheduler_av_st_cmd_alg_core_startofpacket;   // scheduler:av_st_cmd_alg_core_startofpacket -> clipper_core:av_st_cmd_startofpacket
	wire         scheduler_av_st_cmd_alg_core_endofpacket;     // scheduler:av_st_cmd_alg_core_endofpacket -> clipper_core:av_st_cmd_endofpacket
	wire         scheduler_av_st_cmd_vob_valid;                // scheduler:av_st_cmd_vob_valid -> video_out:av_st_cmd_valid
	wire  [63:0] scheduler_av_st_cmd_vob_data;                 // scheduler:av_st_cmd_vob_data -> video_out:av_st_cmd_data
	wire         scheduler_av_st_cmd_vob_ready;                // video_out:av_st_cmd_ready -> scheduler:av_st_cmd_vob_ready
	wire         scheduler_av_st_cmd_vob_startofpacket;        // scheduler:av_st_cmd_vob_startofpacket -> video_out:av_st_cmd_startofpacket
	wire         scheduler_av_st_cmd_vob_endofpacket;          // scheduler:av_st_cmd_vob_endofpacket -> video_out:av_st_cmd_endofpacket
	wire         video_in_resp_av_st_resp_valid;               // video_in_resp:av_st_resp_valid -> scheduler:av_st_resp_vib_valid
	wire  [63:0] video_in_resp_av_st_resp_data;                // video_in_resp:av_st_resp_data -> scheduler:av_st_resp_vib_data
	wire         video_in_resp_av_st_resp_ready;               // scheduler:av_st_resp_vib_ready -> video_in_resp:av_st_resp_ready
	wire         video_in_resp_av_st_resp_startofpacket;       // video_in_resp:av_st_resp_startofpacket -> scheduler:av_st_resp_vib_startofpacket
	wire         video_in_resp_av_st_resp_endofpacket;         // video_in_resp:av_st_resp_endofpacket -> scheduler:av_st_resp_vib_endofpacket
	wire         video_in_resp_av_st_dout_valid;               // video_in_resp:av_st_dout_valid -> video_in_cmd:av_st_din_valid
	wire  [47:0] video_in_resp_av_st_dout_data;                // video_in_resp:av_st_dout_data -> video_in_cmd:av_st_din_data
	wire         video_in_resp_av_st_dout_ready;               // video_in_cmd:av_st_din_ready -> video_in_resp:av_st_dout_ready
	wire         video_in_resp_av_st_dout_startofpacket;       // video_in_resp:av_st_dout_startofpacket -> video_in_cmd:av_st_din_startofpacket
	wire         video_in_resp_av_st_dout_endofpacket;         // video_in_resp:av_st_dout_endofpacket -> video_in_cmd:av_st_din_endofpacket
	wire         video_in_cmd_av_st_dout_valid;                // video_in_cmd:av_st_dout_valid -> user_packet_demux:av_st_din_valid
	wire  [47:0] video_in_cmd_av_st_dout_data;                 // video_in_cmd:av_st_dout_data -> user_packet_demux:av_st_din_data
	wire         video_in_cmd_av_st_dout_ready;                // user_packet_demux:av_st_din_ready -> video_in_cmd:av_st_dout_ready
	wire         video_in_cmd_av_st_dout_startofpacket;        // video_in_cmd:av_st_dout_startofpacket -> user_packet_demux:av_st_din_startofpacket
	wire         video_in_cmd_av_st_dout_endofpacket;          // video_in_cmd:av_st_dout_endofpacket -> user_packet_demux:av_st_din_endofpacket
	wire         user_packet_demux_av_st_dout_0_valid;         // user_packet_demux:av_st_dout_valid_0 -> clipper_core:av_st_din_valid
	wire  [47:0] user_packet_demux_av_st_dout_0_data;          // user_packet_demux:av_st_dout_data_0 -> clipper_core:av_st_din_data
	wire         user_packet_demux_av_st_dout_0_ready;         // clipper_core:av_st_din_ready -> user_packet_demux:av_st_dout_ready_0
	wire         user_packet_demux_av_st_dout_0_startofpacket; // user_packet_demux:av_st_dout_startofpacket_0 -> clipper_core:av_st_din_startofpacket
	wire         user_packet_demux_av_st_dout_0_endofpacket;   // user_packet_demux:av_st_dout_endofpacket_0 -> clipper_core:av_st_din_endofpacket
	wire         scheduler_av_st_cmd_mux_valid;                // scheduler:av_st_cmd_mux_valid -> user_packet_mux:av_st_cmd_valid
	wire  [63:0] scheduler_av_st_cmd_mux_data;                 // scheduler:av_st_cmd_mux_data -> user_packet_mux:av_st_cmd_data
	wire         scheduler_av_st_cmd_mux_ready;                // user_packet_mux:av_st_cmd_ready -> scheduler:av_st_cmd_mux_ready
	wire         scheduler_av_st_cmd_mux_startofpacket;        // scheduler:av_st_cmd_mux_startofpacket -> user_packet_mux:av_st_cmd_startofpacket
	wire         scheduler_av_st_cmd_mux_endofpacket;          // scheduler:av_st_cmd_mux_endofpacket -> user_packet_mux:av_st_cmd_endofpacket
	wire         clipper_core_av_st_dout_valid;                // clipper_core:av_st_dout_valid -> user_packet_mux:av_st_din_valid_0
	wire  [47:0] clipper_core_av_st_dout_data;                 // clipper_core:av_st_dout_data -> user_packet_mux:av_st_din_data_0
	wire         clipper_core_av_st_dout_ready;                // user_packet_mux:av_st_din_ready_0 -> clipper_core:av_st_dout_ready
	wire         clipper_core_av_st_dout_startofpacket;        // clipper_core:av_st_dout_startofpacket -> user_packet_mux:av_st_din_startofpacket_0
	wire         clipper_core_av_st_dout_endofpacket;          // clipper_core:av_st_dout_endofpacket -> user_packet_mux:av_st_din_endofpacket_0
	wire         user_packet_mux_av_st_dout_valid;             // user_packet_mux:av_st_dout_valid -> video_out:av_st_din_valid
	wire  [47:0] user_packet_mux_av_st_dout_data;              // user_packet_mux:av_st_dout_data -> video_out:av_st_din_data
	wire         user_packet_mux_av_st_dout_ready;             // video_out:av_st_din_ready -> user_packet_mux:av_st_dout_ready
	wire         user_packet_mux_av_st_dout_startofpacket;     // user_packet_mux:av_st_dout_startofpacket -> video_out:av_st_din_startofpacket
	wire         user_packet_mux_av_st_dout_endofpacket;       // user_packet_mux:av_st_dout_endofpacket -> video_out:av_st_din_endofpacket
	wire         user_packet_demux_av_st_dout_1_valid;         // user_packet_demux:av_st_dout_valid_1 -> user_packet_mux:av_st_din_valid_1
	wire  [47:0] user_packet_demux_av_st_dout_1_data;          // user_packet_demux:av_st_dout_data_1 -> user_packet_mux:av_st_din_data_1
	wire         user_packet_demux_av_st_dout_1_ready;         // user_packet_mux:av_st_din_ready_1 -> user_packet_demux:av_st_dout_ready_1
	wire         user_packet_demux_av_st_dout_1_startofpacket; // user_packet_demux:av_st_dout_startofpacket_1 -> user_packet_mux:av_st_din_startofpacket_1
	wire         user_packet_demux_av_st_dout_1_endofpacket;   // user_packet_demux:av_st_dout_endofpacket_1 -> user_packet_mux:av_st_din_endofpacket_1
	wire  [95:0] user_packet_demux_av_st_dout_data;            // port fragment
	wire   [1:0] user_packet_demux_av_st_dout_valid;           // port fragment
	wire   [1:0] user_packet_demux_av_st_dout_startofpacket;   // port fragment
	wire   [1:0] user_packet_demux_av_st_dout_endofpacket;     // port fragment
	wire   [1:0] user_packet_mux_av_st_din_ready;              // port fragment

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (BITS_PER_SYMBOL != 8)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					bits_per_symbol_check ( .error(1'b1) );
		end
		if (NUMBER_OF_COLOR_PLANES != 2)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					number_of_color_planes_check ( .error(1'b1) );
		end
		if (COLOR_PLANES_ARE_IN_PARALLEL != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					color_planes_are_in_parallel_check ( .error(1'b1) );
		end
		if (PIXELS_IN_PARALLEL != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					pixels_in_parallel_check ( .error(1'b1) );
		end
		if (MAX_IN_WIDTH != 720)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					max_in_width_check ( .error(1'b1) );
		end
		if (MAX_IN_HEIGHT != 576)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					max_in_height_check ( .error(1'b1) );
		end
		if (CLIPPING_METHOD != "RECTANGLE")
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					clipping_method_check ( .error(1'b1) );
		end
		if (LEFT_OFFSET != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					left_offset_check ( .error(1'b1) );
		end
		if (RIGHT_OFFSET != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					right_offset_check ( .error(1'b1) );
		end
		if (TOP_OFFSET != 24)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					top_offset_check ( .error(1'b1) );
		end
		if (BOTTOM_OFFSET != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					bottom_offset_check ( .error(1'b1) );
		end
		if (RECTANGLE_WIDTH != 720)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					rectangle_width_check ( .error(1'b1) );
		end
		if (RECTANGLE_HEIGHT != 480)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					rectangle_height_check ( .error(1'b1) );
		end
		if (USER_PACKET_SUPPORT != "PASSTHROUGH")
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					user_packet_support_check ( .error(1'b1) );
		end
		if (RUNTIME_CONTROL != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					runtime_control_check ( .error(1'b1) );
		end
		if (LIMITED_READBACK != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					limited_readback_check ( .error(1'b1) );
		end
	endgenerate

	alt_vip_video_input_bridge_resp #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.DEFAULT_LINE_LENGTH          (720),
		.VIB_MODE                     ("FULL"),
		.VIDEO_PROTOCOL_NO            (1),
		.READY_LATENCY_1              (1),
		.MAX_WIDTH                    (720),
		.MAX_HEIGHT                   (576),
		.ENABLE_RESOLUTION_CHECK      (1),
		.MULTI_CONTEXT_SUPPORT        (0),
		.PIPELINE_READY               (0),
		.RESP_SRC_ADDRESS             (0),
		.RESP_DST_ADDRESS             (0),
		.DATA_SRC_ADDRESS             (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8)
	) video_in_resp (
		.clock                       (main_clock),                             //    main_clock.clk
		.reset                       (main_reset),                             //    main_reset.reset
		.av_st_vid_din_data          (din_data),                               // av_st_vid_din.data
		.av_st_vid_din_valid         (din_valid),                              //              .valid
		.av_st_vid_din_startofpacket (din_startofpacket),                      //              .startofpacket
		.av_st_vid_din_endofpacket   (din_endofpacket),                        //              .endofpacket
		.av_st_vid_din_ready         (din_ready),                              //              .ready
		.av_st_resp_valid            (video_in_resp_av_st_resp_valid),         //    av_st_resp.valid
		.av_st_resp_startofpacket    (video_in_resp_av_st_resp_startofpacket), //              .startofpacket
		.av_st_resp_endofpacket      (video_in_resp_av_st_resp_endofpacket),   //              .endofpacket
		.av_st_resp_data             (video_in_resp_av_st_resp_data),          //              .data
		.av_st_resp_ready            (video_in_resp_av_st_resp_ready),         //              .ready
		.av_st_dout_valid            (video_in_resp_av_st_dout_valid),         //    av_st_dout.valid
		.av_st_dout_startofpacket    (video_in_resp_av_st_dout_startofpacket), //              .startofpacket
		.av_st_dout_endofpacket      (video_in_resp_av_st_dout_endofpacket),   //              .endofpacket
		.av_st_dout_data             (video_in_resp_av_st_dout_data),          //              .data
		.av_st_dout_ready            (video_in_resp_av_st_dout_ready)          //              .ready
	);

	alt_vip_video_output_bridge #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.VIDEO_PROTOCOL_NO            (1),
		.READY_LATENCY_1              (1),
		.SOP_PRE_ALIGNED              (0),
		.MULTI_CONTEXT_SUPPORT        (0),
		.TYPE_11_SUPPORT              (0),
		.NO_CONCATENATION             (0),
		.PIPELINE_READY               (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8),
		.LOW_LATENCY_COMMAND_MODE     (0)
	) video_out (
		.clock                        (main_clock),                               //     main_clock.clk
		.reset                        (main_reset),                               //     main_reset.reset
		.av_st_cmd_valid              (scheduler_av_st_cmd_vob_valid),            //      av_st_cmd.valid
		.av_st_cmd_startofpacket      (scheduler_av_st_cmd_vob_startofpacket),    //               .startofpacket
		.av_st_cmd_endofpacket        (scheduler_av_st_cmd_vob_endofpacket),      //               .endofpacket
		.av_st_cmd_data               (scheduler_av_st_cmd_vob_data),             //               .data
		.av_st_cmd_ready              (scheduler_av_st_cmd_vob_ready),            //               .ready
		.av_st_din_valid              (user_packet_mux_av_st_dout_valid),         //      av_st_din.valid
		.av_st_din_startofpacket      (user_packet_mux_av_st_dout_startofpacket), //               .startofpacket
		.av_st_din_endofpacket        (user_packet_mux_av_st_dout_endofpacket),   //               .endofpacket
		.av_st_din_data               (user_packet_mux_av_st_dout_data),          //               .data
		.av_st_din_ready              (user_packet_mux_av_st_dout_ready),         //               .ready
		.av_st_vid_dout_data          (dout_data),                                // av_st_vid_dout.data
		.av_st_vid_dout_valid         (dout_valid),                               //               .valid
		.av_st_vid_dout_startofpacket (dout_startofpacket),                       //               .startofpacket
		.av_st_vid_dout_endofpacket   (dout_endofpacket),                         //               .endofpacket
		.av_st_vid_dout_ready         (dout_ready)                                //               .ready
	);

	alt_vip_video_input_bridge_cmd #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.PIPELINE_READY               (0),
		.DATA_SRC_ADDRESS             (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8)
	) video_in_cmd (
		.clock                    (main_clock),                             // main_clock.clk
		.reset                    (main_reset),                             // main_reset.reset
		.av_st_cmd_valid          (scheduler_av_st_cmd_vib_valid),          //  av_st_cmd.valid
		.av_st_cmd_startofpacket  (scheduler_av_st_cmd_vib_startofpacket),  //           .startofpacket
		.av_st_cmd_endofpacket    (scheduler_av_st_cmd_vib_endofpacket),    //           .endofpacket
		.av_st_cmd_data           (scheduler_av_st_cmd_vib_data),           //           .data
		.av_st_cmd_ready          (scheduler_av_st_cmd_vib_ready),          //           .ready
		.av_st_din_valid          (video_in_resp_av_st_dout_valid),         //  av_st_din.valid
		.av_st_din_startofpacket  (video_in_resp_av_st_dout_startofpacket), //           .startofpacket
		.av_st_din_endofpacket    (video_in_resp_av_st_dout_endofpacket),   //           .endofpacket
		.av_st_din_data           (video_in_resp_av_st_dout_data),          //           .data
		.av_st_din_ready          (video_in_resp_av_st_dout_ready),         //           .ready
		.av_st_dout_valid         (video_in_cmd_av_st_dout_valid),          // av_st_dout.valid
		.av_st_dout_startofpacket (video_in_cmd_av_st_dout_startofpacket),  //           .startofpacket
		.av_st_dout_endofpacket   (video_in_cmd_av_st_dout_endofpacket),    //           .endofpacket
		.av_st_dout_data          (video_in_cmd_av_st_dout_data),           //           .data
		.av_st_dout_ready         (video_in_cmd_av_st_dout_ready)           //           .ready
	);

	alt_vip_clipper_alg_core #(
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.BITS_PER_SYMBOL              (8),
		.PIXELS_IN_PARALLEL           (1),
		.MAX_IN_WIDTH                 (720),
		.DATA_SRC_ADDRESS             (2),
		.PIPELINE_DATA_OUTPUT         (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8)
	) clipper_core (
		.clock                    (main_clock),                                   // main_clock.clk
		.reset                    (main_reset),                                   // main_reset.reset
		.av_st_cmd_valid          (scheduler_av_st_cmd_alg_core_valid),           //  av_st_cmd.valid
		.av_st_cmd_startofpacket  (scheduler_av_st_cmd_alg_core_startofpacket),   //           .startofpacket
		.av_st_cmd_endofpacket    (scheduler_av_st_cmd_alg_core_endofpacket),     //           .endofpacket
		.av_st_cmd_data           (scheduler_av_st_cmd_alg_core_data),            //           .data
		.av_st_cmd_ready          (scheduler_av_st_cmd_alg_core_ready),           //           .ready
		.av_st_din_valid          (user_packet_demux_av_st_dout_0_valid),         //  av_st_din.valid
		.av_st_din_startofpacket  (user_packet_demux_av_st_dout_0_startofpacket), //           .startofpacket
		.av_st_din_endofpacket    (user_packet_demux_av_st_dout_0_endofpacket),   //           .endofpacket
		.av_st_din_data           (user_packet_demux_av_st_dout_0_data),          //           .data
		.av_st_din_ready          (user_packet_demux_av_st_dout_0_ready),         //           .ready
		.av_st_dout_valid         (clipper_core_av_st_dout_valid),                // av_st_dout.valid
		.av_st_dout_startofpacket (clipper_core_av_st_dout_startofpacket),        //           .startofpacket
		.av_st_dout_endofpacket   (clipper_core_av_st_dout_endofpacket),          //           .endofpacket
		.av_st_dout_data          (clipper_core_av_st_dout_data),                 //           .data
		.av_st_dout_ready         (clipper_core_av_st_dout_ready)                 //           .ready
	);

	alt_vip_clipper_scheduler #(
		.MAX_IN_WIDTH        (720),
		.MAX_IN_HEIGHT       (576),
		.RECTANGLE_MODE      (1),
		.LEFT_OFFSET         (0),
		.RIGHT_OFFSET        (0),
		.TOP_OFFSET          (24),
		.BOTTOM_OFFSET       (0),
		.OUT_WIDTH           (720),
		.OUT_HEIGHT          (480),
		.USER_PACKET_SUPPORT ("PASSTHROUGH"),
		.PIPELINE_READY      (1),
		.RUNTIME_CONTROL     (0),
		.LIMITED_READBACK    (0),
		.SRC_WIDTH           (8),
		.DST_WIDTH           (8),
		.CONTEXT_WIDTH       (8),
		.TASK_WIDTH          (8)
	) scheduler (
		.clock                            (main_clock),                                 //         main_clock.clk
		.reset                            (main_reset),                                 //         main_reset.reset
		.av_st_cmd_vib_valid              (scheduler_av_st_cmd_vib_valid),              //      av_st_cmd_vib.valid
		.av_st_cmd_vib_startofpacket      (scheduler_av_st_cmd_vib_startofpacket),      //                   .startofpacket
		.av_st_cmd_vib_endofpacket        (scheduler_av_st_cmd_vib_endofpacket),        //                   .endofpacket
		.av_st_cmd_vib_data               (scheduler_av_st_cmd_vib_data),               //                   .data
		.av_st_cmd_vib_ready              (scheduler_av_st_cmd_vib_ready),              //                   .ready
		.av_st_cmd_alg_core_valid         (scheduler_av_st_cmd_alg_core_valid),         // av_st_cmd_alg_core.valid
		.av_st_cmd_alg_core_startofpacket (scheduler_av_st_cmd_alg_core_startofpacket), //                   .startofpacket
		.av_st_cmd_alg_core_endofpacket   (scheduler_av_st_cmd_alg_core_endofpacket),   //                   .endofpacket
		.av_st_cmd_alg_core_data          (scheduler_av_st_cmd_alg_core_data),          //                   .data
		.av_st_cmd_alg_core_ready         (scheduler_av_st_cmd_alg_core_ready),         //                   .ready
		.av_st_cmd_vob_valid              (scheduler_av_st_cmd_vob_valid),              //      av_st_cmd_vob.valid
		.av_st_cmd_vob_startofpacket      (scheduler_av_st_cmd_vob_startofpacket),      //                   .startofpacket
		.av_st_cmd_vob_endofpacket        (scheduler_av_st_cmd_vob_endofpacket),        //                   .endofpacket
		.av_st_cmd_vob_data               (scheduler_av_st_cmd_vob_data),               //                   .data
		.av_st_cmd_vob_ready              (scheduler_av_st_cmd_vob_ready),              //                   .ready
		.av_st_resp_vib_valid             (video_in_resp_av_st_resp_valid),             //     av_st_resp_vib.valid
		.av_st_resp_vib_startofpacket     (video_in_resp_av_st_resp_startofpacket),     //                   .startofpacket
		.av_st_resp_vib_endofpacket       (video_in_resp_av_st_resp_endofpacket),       //                   .endofpacket
		.av_st_resp_vib_data              (video_in_resp_av_st_resp_data),              //                   .data
		.av_st_resp_vib_ready             (video_in_resp_av_st_resp_ready),             //                   .ready
		.av_st_cmd_mux_valid              (scheduler_av_st_cmd_mux_valid),              //      av_st_cmd_mux.valid
		.av_st_cmd_mux_startofpacket      (scheduler_av_st_cmd_mux_startofpacket),      //                   .startofpacket
		.av_st_cmd_mux_endofpacket        (scheduler_av_st_cmd_mux_endofpacket),        //                   .endofpacket
		.av_st_cmd_mux_data               (scheduler_av_st_cmd_mux_data),               //                   .data
		.av_st_cmd_mux_ready              (scheduler_av_st_cmd_mux_ready)               //                   .ready
	);

	alt_vip_packet_demux #(
		.NUM_OUTPUTS        (2),
		.CLIP_ADDRESS_BITS  (0),
		.SHIFT_ADDRESS_BITS (0),
		.REGISTER_OUTPUT    (1),
		.PIPELINE_READY     (0),
		.SRC_WIDTH          (8),
		.DST_WIDTH          (8),
		.CONTEXT_WIDTH      (8),
		.TASK_WIDTH         (8),
		.DATA_WIDTH_INT     (16),
		.USER_WIDTH_INT     (0)
	) user_packet_demux (
		.clock                    (main_clock),                                                                                    //   main_clock.clk
		.reset                    (main_reset),                                                                                    //   main_reset.reset
		.av_st_din_valid          (video_in_cmd_av_st_dout_valid),                                                                 //    av_st_din.valid
		.av_st_din_startofpacket  (video_in_cmd_av_st_dout_startofpacket),                                                         //             .startofpacket
		.av_st_din_endofpacket    (video_in_cmd_av_st_dout_endofpacket),                                                           //             .endofpacket
		.av_st_din_data           (video_in_cmd_av_st_dout_data),                                                                  //             .data
		.av_st_din_ready          (video_in_cmd_av_st_dout_ready),                                                                 //             .ready
		.av_st_dout_valid         ({user_packet_demux_av_st_dout_valid[1],user_packet_demux_av_st_dout_valid[0]}),                 // av_st_dout_0.valid
		.av_st_dout_startofpacket ({user_packet_demux_av_st_dout_startofpacket[1],user_packet_demux_av_st_dout_startofpacket[0]}), //             .startofpacket
		.av_st_dout_endofpacket   ({user_packet_demux_av_st_dout_endofpacket[1],user_packet_demux_av_st_dout_endofpacket[0]}),     //             .endofpacket
		.av_st_dout_data          ({user_packet_demux_av_st_dout_data[95:48],user_packet_demux_av_st_dout_data[47:0]}),            //             .data
		.av_st_dout_ready         ({user_packet_demux_av_st_dout_1_ready,user_packet_demux_av_st_dout_0_ready})                    //             .ready
	);

	alt_vip_packet_mux #(
		.NUM_INPUTS      (2),
		.REGISTER_OUTPUT (1),
		.PIPELINE_READY  (0),
		.NAME            ("undefined"),
		.SRC_WIDTH       (8),
		.DST_WIDTH       (8),
		.CONTEXT_WIDTH   (8),
		.TASK_WIDTH      (8),
		.DATA_WIDTH_INT  (16),
		.USER_WIDTH_INT  (0)
	) user_packet_mux (
		.clock                    (main_clock),                                                                           //  main_clock.clk
		.reset                    (main_reset),                                                                           //  main_reset.reset
		.av_st_cmd_valid          (scheduler_av_st_cmd_mux_valid),                                                        //   av_st_cmd.valid
		.av_st_cmd_startofpacket  (scheduler_av_st_cmd_mux_startofpacket),                                                //            .startofpacket
		.av_st_cmd_endofpacket    (scheduler_av_st_cmd_mux_endofpacket),                                                  //            .endofpacket
		.av_st_cmd_data           (scheduler_av_st_cmd_mux_data),                                                         //            .data
		.av_st_cmd_ready          (scheduler_av_st_cmd_mux_ready),                                                        //            .ready
		.av_st_din_valid          ({user_packet_demux_av_st_dout_1_valid,clipper_core_av_st_dout_valid}),                 // av_st_din_0.valid
		.av_st_din_startofpacket  ({user_packet_demux_av_st_dout_1_startofpacket,clipper_core_av_st_dout_startofpacket}), //            .startofpacket
		.av_st_din_endofpacket    ({user_packet_demux_av_st_dout_1_endofpacket,clipper_core_av_st_dout_endofpacket}),     //            .endofpacket
		.av_st_din_data           ({user_packet_demux_av_st_dout_1_data[47:0],clipper_core_av_st_dout_data[47:0]}),       //            .data
		.av_st_din_ready          ({user_packet_mux_av_st_din_ready[1],user_packet_mux_av_st_din_ready[0]}),              //            .ready
		.av_st_dout_valid         (user_packet_mux_av_st_dout_valid),                                                     //  av_st_dout.valid
		.av_st_dout_startofpacket (user_packet_mux_av_st_dout_startofpacket),                                             //            .startofpacket
		.av_st_dout_endofpacket   (user_packet_mux_av_st_dout_endofpacket),                                               //            .endofpacket
		.av_st_dout_data          (user_packet_mux_av_st_dout_data),                                                      //            .data
		.av_st_dout_ready         (user_packet_mux_av_st_dout_ready)                                                      //            .ready
	);

	assign user_packet_demux_av_st_dout_0_valid = { user_packet_demux_av_st_dout_valid[0] };

	assign user_packet_demux_av_st_dout_0_data = { user_packet_demux_av_st_dout_data[47:0] };

	assign user_packet_demux_av_st_dout_0_startofpacket = { user_packet_demux_av_st_dout_startofpacket[0] };

	assign user_packet_demux_av_st_dout_0_endofpacket = { user_packet_demux_av_st_dout_endofpacket[0] };

	assign clipper_core_av_st_dout_ready = { user_packet_mux_av_st_din_ready[0] };

	assign user_packet_demux_av_st_dout_1_valid = { user_packet_demux_av_st_dout_valid[1] };

	assign user_packet_demux_av_st_dout_1_data = { user_packet_demux_av_st_dout_data[95:48] };

	assign user_packet_demux_av_st_dout_1_ready = { user_packet_mux_av_st_din_ready[1] };

	assign user_packet_demux_av_st_dout_1_startofpacket = { user_packet_demux_av_st_dout_startofpacket[1] };

	assign user_packet_demux_av_st_dout_1_endofpacket = { user_packet_demux_av_st_dout_endofpacket[1] };

endmodule
